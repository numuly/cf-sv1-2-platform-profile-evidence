#!/usr/bin/env python3
"""Dump ACPI firmware tables on Windows via GetSystemFirmwareTable().

No third-party driver: uses the documented Win32 API that FirmwareTablesView
and ACPICA's acpidump for Windows also build on.  Requires admin on some
systems (SeSystemEnvironmentPrivilege is not needed for ACPI, but running
elevated is harmless).

Output: one .bin per table, tables.csv index, and a human-readable
acpidump-like .txt with the headers and raw hex.
"""
import ctypes
import ctypes.wintypes as wt
import csv
import hashlib
import os
import struct
import sys
from datetime import datetime, timezone

kernel32 = ctypes.WinDLL("kernel32", use_last_error=True)

kernel32.EnumSystemFirmwareTables.argtypes = [wt.DWORD, ctypes.c_void_p, wt.DWORD]
kernel32.EnumSystemFirmwareTables.restype = wt.DWORD
kernel32.GetSystemFirmwareTable.argtypes = [wt.DWORD, wt.DWORD, ctypes.c_void_p, wt.DWORD]
kernel32.GetSystemFirmwareTable.restype = wt.DWORD

ACPI = 0x41435049  # 'ACPI'


def enum_tables():
    n = kernel32.EnumSystemFirmwareTables(ACPI, None, 0)
    if n == 0:
        raise OSError(ctypes.get_last_error(), "EnumSystemFirmwareTables failed")
    buf = ctypes.create_string_buffer(n)
    n2 = kernel32.EnumSystemFirmwareTables(ACPI, buf, n)
    if n2 == 0:
        raise OSError(ctypes.get_last_error(), "EnumSystemFirmwareTables failed")
    return [struct.unpack_from("<I", buf.raw, i)[0] for i in range(0, n2, 4)]


def get_table(table_id):
    size = kernel32.GetSystemFirmwareTable(ACPI, table_id, None, 0)
    if size == 0:
        raise OSError(ctypes.get_last_error(),
                      "GetSystemFirmwareTable size failed for 0x%08x" % table_id)
    buf = ctypes.create_string_buffer(size)
    got = kernel32.GetSystemFirmwareTable(ACPI, table_id, buf, size)
    if got == 0:
        raise OSError(ctypes.get_last_error(),
                      "GetSystemFirmwareTable data failed for 0x%08x" % table_id)
    return buf.raw[:got]


def id_to_sig(table_id):
    # Windows returns the 4-char signature in the low byte order of the DWORD.
    return struct.pack("<I", table_id)


def ascii_sig(raw):
    return raw[:4].decode("ascii", "replace").strip("\x00 ")


def main(outdir):
    os.makedirs(outdir, exist_ok=True)
    ids = enum_tables()
    print("enumerated %d ACPI table ids" % len(ids))

    counts = {}
    rows = []
    txt = []
    txt.append("Windows ACPI firmware table dump")
    txt.append("host: %s" % os.environ.get("COMPUTERNAME", "?"))
    txt.append("time: %s" % datetime.now(timezone.utc).astimezone().isoformat())
    txt.append("api:  GetSystemFirmwareTable('ACPI')")
    txt.append("")

    for tid in ids:
        raw = get_table(tid)
        sig = ascii_sig(raw) or "????"
        counts[sig] = counts.get(sig, 0) + 1
        idx = counts[sig]
        fn = "%s_%d.bin" % (sig, idx)
        path = os.path.join(outdir, fn)
        with open(path, "wb") as f:
            f.write(raw)
        sha = hashlib.sha256(raw).hexdigest()
        hdr = {}
        if len(raw) >= 36:
            (h_sig, h_len, h_rev, h_sum, h_oemid, h_oemtable, h_oemrev,
             h_creator, h_creatorrev) = struct.unpack_from("<4sIBB6s8sI4sI", raw, 0)
            hdr = dict(
                signature=h_sig.decode("ascii", "replace"),
                length=h_len,
                revision=h_rev,
                checksum_ok=(sum(raw[:h_len]) & 0xFF) == 0 if h_len <= len(raw) else None,
                oem_id=h_oemid.decode("ascii", "replace").rstrip("\x00 "),
                oem_table_id=h_oemtable.decode("ascii", "replace").rstrip("\x00 "),
                oem_revision=h_oemrev,
                creator_id=h_creator.decode("ascii", "replace").rstrip("\x00 "),
                creator_revision=h_creatorrev,
            )
        rows.append(dict(filename=fn, table_id="0x%08x" % tid, sig=sig,
                         instance=idx, bytes=len(raw), sha256=sha, **hdr))

        txt.append("=" * 78)
        txt.append("%s  (%d bytes, sha256 %s)" % (fn, len(raw), sha))
        txt.append("table_id=0x%08x" % tid)
        for k in ("signature", "length", "revision", "checksum_ok", "oem_id",
                  "oem_table_id", "oem_revision", "creator_id", "creator_revision"):
            if k in hdr:
                txt.append("  %-16s %s" % (k + ":", hdr[k]))
        txt.append("  hex:")
        for off in range(0, len(raw), 16):
            chunk = raw[off:off + 16]
            hexs = " ".join("%02x" % b for b in chunk)
            asc = "".join(chr(b) if 32 <= b < 127 else "." for b in chunk)
            txt.append("  %08x  %-47s  %s" % (off, hexs, asc))
        txt.append("")

    with open(os.path.join(outdir, "tables.csv"), "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0].keys()) if rows else ["filename"])
        w.writeheader()
        w.writerows(rows)
    with open(os.path.join(outdir, "acpidump-windows.txt"), "w", encoding="utf-8") as f:
        f.write("\n".join(txt))

    for r in rows:
        print("%-12s %7d  %s" % (r["filename"], r["bytes"], r["sha256"]))


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "acpi")
