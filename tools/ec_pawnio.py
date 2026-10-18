#!/usr/bin/env python3
"""ACPI EC access on Windows through PawnIO's signed LpcACPIEC module.

PawnIO exposes only raw byte in/out on the EC ports (0x62 data, 0x66 cmd/status);
the standard ACPI EC transaction is implemented here.  Read-only unless a
subcommand writes.
"""
import ctypes
import ctypes.wintypes as wt
import os
import sys
import time

PAWNIO = r"C:\Program Files\PawnIO\PawnIOLib.dll"
EC_BLOB = os.path.join(os.path.dirname(os.path.abspath(__file__)), "LpcACPIEC.bin")

pawnio = ctypes.WinDLL(PAWNIO)
pawnio.pawnio_open.argtypes = [ctypes.POINTER(wt.HANDLE)]
pawnio.pawnio_open.restype = ctypes.c_long
pawnio.pawnio_load.argtypes = [wt.HANDLE, ctypes.c_char_p, ctypes.c_size_t]
pawnio.pawnio_load.restype = ctypes.c_long
pawnio.pawnio_execute.argtypes = [wt.HANDLE, ctypes.c_char_p, ctypes.POINTER(ctypes.c_ulonglong),
                                  ctypes.c_size_t, ctypes.POINTER(ctypes.c_ulonglong),
                                  ctypes.c_size_t, ctypes.POINTER(ctypes.c_size_t)]
pawnio.pawnio_execute.restype = ctypes.c_long
pawnio.pawnio_close.argtypes = [wt.HANDLE]
pawnio.pawnio_close.restype = ctypes.c_long

k32 = ctypes.WinDLL("kernel32", use_last_error=True)
k32.CreateMutexW.argtypes = [ctypes.c_void_p, wt.BOOL, wt.LPCWSTR]
k32.CreateMutexW.restype = wt.HANDLE
k32.WaitForSingleObject.argtypes = [wt.HANDLE, wt.DWORD]
k32.WaitForSingleObject.restype = wt.DWORD
k32.ReleaseMutex.argtypes = [wt.HANDLE]
k32.CloseHandle.argtypes = [wt.HANDLE]

_handle = None
_mutex = None


def open_pawnio():
    global _handle
    h = wt.HANDLE()
    hr = pawnio.pawnio_open(ctypes.byref(h))
    if hr < 0:
        raise OSError("pawnio_open failed: 0x%08x" % (hr & 0xFFFFFFFF))
    blob = open(EC_BLOB, "rb").read()
    hr = pawnio.pawnio_load(h, blob, len(blob))
    if hr < 0:
        raise OSError("pawnio_load(LpcACPIEC) failed: 0x%08x" % (hr & 0xFFFFFFFF))
    _handle = h
    return h


def _exec(name, inbuf, out_n):
    in_n = len(inbuf)
    if out_n:
        out = (ctypes.c_ulonglong * out_n)()
        out_p = out
    else:
        out = None
        out_p = None
    got = ctypes.c_size_t(0)
    hr = pawnio.pawnio_execute(_handle, name.encode(), inbuf, in_n, out_p, out_n, ctypes.byref(got))
    if hr < 0:
        raise OSError("%s failed: 0x%08x" % (name, hr & 0xFFFFFFFF))
    return [out[i] for i in range(got.value)] if out_n else []


def port_in(port):
    return _exec("ioctl_pio_read", (ctypes.c_ulonglong * 1)(port), 1)[0]


def port_out(port, value):
    _exec("ioctl_pio_write", (ctypes.c_ulonglong * 2)(port, value), 0)


def wait_ibf(timeout=0.05):
    t0 = time.time()
    while time.time() - t0 < timeout:
        if not (port_in(0x66) & 0x02):
            return True
    return False


def wait_obf(timeout=0.05):
    t0 = time.time()
    while time.time() - t0 < timeout:
        if port_in(0x66) & 0x01:
            return True
    return False


def ec_read(addr):
    for _ in range(3):
        if not wait_ibf():
            continue
        port_out(0x66, 0x80)
        if not wait_ibf():
            continue
        port_out(0x62, addr)
        if not wait_obf():
            continue
        return port_in(0x62)
    raise OSError("EC read 0x%02x timed out" % addr)


def ec_write(addr, value):
    for _ in range(3):
        if not wait_ibf():
            continue
        port_out(0x66, 0x81)
        if not wait_ibf():
            continue
        port_out(0x62, addr)
        if not wait_ibf():
            continue
        port_out(0x62, value)
        return
    raise OSError("EC write 0x%02x timed out" % addr)


def lock():
    global _mutex
    _mutex = k32.CreateMutexW(None, False, r"Global\Access_EC")
    if not _mutex:
        raise OSError("CreateMutex failed: %d" % ctypes.get_last_error())
    k32.WaitForSingleObject(_mutex, 5000)


def unlock():
    if _mutex:
        k32.ReleaseMutex(_mutex)
        k32.CloseHandle(_mutex)


def dump(start=0, end=0x100):
    open_pawnio()
    lock()
    try:
        for base in range(start, end, 16):
            vals = []
            for a in range(base, min(base + 16, end)):
                try:
                    vals.append(ec_read(a))
                except OSError as e:
                    vals.append(None)
            print("%02x: %s" % (base, " ".join("%02x" % v if v is not None else "--" for v in vals)))
    finally:
        unlock()
        pawnio.pawnio_close(_handle)


if __name__ == "__main__":
    if len(sys.argv) >= 2 and sys.argv[1] == "dump":
        dump(int(sys.argv[2], 0) if len(sys.argv) > 2 else 0,
             int(sys.argv[3], 0) if len(sys.argv) > 3 else 0x100)
    else:
        print("usage: ec_pawnio.py dump [start] [end]")
