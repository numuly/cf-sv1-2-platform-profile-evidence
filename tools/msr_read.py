#!/usr/bin/env python3
"""Read MSRs via PawnIO's signed IntelMSR module."""
import ctypes
import ctypes.wintypes as wt
import os
import sys

PAWNIO = r"C:\Program Files\PawnIO\PawnIOLib.dll"
BLOB = os.path.join(os.path.dirname(os.path.abspath(__file__)), "IntelMSR.bin")

pawnio = ctypes.WinDLL(PAWNIO)
pawnio.pawnio_open.argtypes = [ctypes.POINTER(wt.HANDLE)]
pawnio.pawnio_load.argtypes = [wt.HANDLE, ctypes.c_char_p, ctypes.c_size_t]
pawnio.pawnio_execute.argtypes = [wt.HANDLE, ctypes.c_char_p, ctypes.POINTER(ctypes.c_ulonglong),
                                  ctypes.c_size_t, ctypes.POINTER(ctypes.c_ulonglong),
                                  ctypes.c_size_t, ctypes.POINTER(ctypes.c_size_t)]
pawnio.pawnio_close.argtypes = [wt.HANDLE]


def read_msr(handle, msr):
    out = (ctypes.c_ulonglong * 1)()
    got = ctypes.c_size_t(0)
    hr = pawnio.pawnio_execute(handle, b"ioctl_read_msr", (ctypes.c_ulonglong * 1)(msr), 1,
                               out, 1, ctypes.byref(got))
    if hr < 0:
        raise OSError("read_msr 0x%x failed: 0x%08x" % (msr, hr & 0xFFFFFFFF))
    return out[0]


def main():
    h = wt.HANDLE()
    hr = pawnio.pawnio_open(ctypes.byref(h))
    if hr < 0:
        raise OSError("open 0x%08x" % (hr & 0xFFFFFFFF))
    blob = open(BLOB, "rb").read()
    hr = pawnio.pawnio_load(h, blob, len(blob))
    if hr < 0:
        raise OSError("load 0x%08x" % (hr & 0xFFFFFFFF))
    try:
        for msr in [0x1A0, 0x610, 0x770, 0x771, 0x772, 0x773, 0x774]:
            try:
                v = read_msr(h, msr)
            except OSError as e:
                print("0x%03X: error %s" % (msr, e))
                continue
            print("0x%03X: 0x%016X" % (msr, v))
            if msr == 0x774:
                print("      HWP_REQUEST min=%d max=%d des=%d epp=%d" % (
                    v & 0xFF, (v >> 8) & 0xFF, (v >> 16) & 0xFF, (v >> 24) & 0xFF))
            if msr == 0x770:
                print("      HWP_CAP highest=%d guaranteed=%d efficient=%d lowest=%d" % (
                    v & 0xFF, (v >> 8) & 0xFF, (v >> 16) & 0xFF, (v >> 24) & 0xFF))
            if msr == 0x1A0:
                print("      turbo_disabled=%d" % ((v >> 38) & 1))
    finally:
        pawnio.pawnio_close(h)


if __name__ == "__main__":
    main()
