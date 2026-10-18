#!/usr/bin/env python3
"""Dump every ACPI table Windows exposes in HKLM\\HARDWARE\\ACPI.

The Win32 GetSystemFirmwareTable() API returns only the *first* table for a
duplicated signature (there are 12 SSDTs here), so a full dump cannot be made
from user mode with it.  The kernel keeps a complete copy of every ACPI table
in the registry hive HKLM\\HARDWARE\\ACPI, which is what this script reads.
Requires administrator (the HARDWARE hive is volatile but readable as admin).
"""
import winreg
import csv
import hashlib
import os
import struct
import sys
from datetime import datetime, timezone

ROOT = winreg.HKEY_LOCAL_MACHINE
BASE = r"HARDWARE\ACPI"

# Windows registry key -> real ACPI signature
SIG_MAP = {
    "DSDT": "DSDT",
    "FACS": "FACS",
    "FADT": "FACP",
    "RSDT": "XSDT",   # Windows stores the XSDT here on x64 UEFI
}


def walk(path, out):
    k = winreg.OpenKey(ROOT, path, 0, winreg.KEY_READ)
    i = 0
    while True:
        try:
            name, data, typ = winreg.EnumValue(k, i)
        except OSError:
            break
        if isinstance(data, bytes):
            out.append((path, name, data))
        i += 1
    i = 0
    while True:
        try:
            sub = winreg.EnumKey(k, i)
        except OSError:
            break
        walk(path + "\\" + sub, out)
        i += 1
    winreg.CloseKey(k)


def ascii_field(b):
    return b.decode("ascii", "replace").rstrip("\x00 ").strip()


def main(outdir):
    os.makedirs(outdir, exist_ok=True)
    rows = []
    for path, name, data in (lambda o: (walk(BASE, o), o)[1])([]):
        rel = path[len(BASE) + 1:]
        top = rel.split("\\")[0]
        sig = SIG_MAP.get(top)
        inst = None
        if sig is None:
            if top == "SSDT":
                sig = "SSDT"
            elif top.startswith("SSD") and len(top) == 4:
                sig = "SSDT"
                inst = int(top[3], 16)
            else:
                sig = top[:4]
        if inst is None:
            # count per signature
            inst = sum(1 for r in rows if r["signature"] == sig) + 1
        hdr = {}
        if len(data) >= 36:
            (h_sig, h_len, h_rev, h_sum, h_oemid, h_oemtable, h_oemrev,
             h_creator, h_creatorrev) = struct.unpack_from("<4sIBB6s8sI4sI", data, 0)
            hdr = dict(
                header_signature=h_sig.decode("ascii", "replace"),
                length=h_len,
                revision=h_rev,
                checksum_ok=(sum(data[:h_len]) & 0xFF) == 0 if h_len <= len(data) else None,
                oem_id=ascii_field(h_oemid),
                oem_table_id=ascii_field(h_oemtable),
                oem_revision=h_oemrev,
                creator_id=ascii_field(h_creator),
                creator_revision=h_creatorrev,
            )
        fn = "%s_%02d_%s.bin" % (sig, inst, hdr.get("oem_table_id", "unknown") or "unknown")
        fn = "".join(c if c.isalnum() or c in "._-" else "_" for c in fn)
        with open(os.path.join(outdir, fn), "wb") as f:
            f.write(data)
        rows.append(dict(filename=fn, registry_key=path, value_name=name,
                         signature=sig, instance=inst, bytes=len(data),
                         sha256=hashlib.sha256(data).hexdigest(), **hdr))
        print("%-40s %6d  %s" % (fn, len(data), hashlib.sha256(data).hexdigest()))

    rows.sort(key=lambda r: (r["signature"], r["instance"]))
    with open(os.path.join(outdir, "index.csv"), "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        w.writeheader()
        w.writerows(rows)
    with open(os.path.join(outdir, "acpi-registry-dump.txt"), "w", encoding="utf-8") as f:
        f.write("Windows ACPI table dump from HKLM\\HARDWARE\\ACPI\n")
        f.write("host: %s\n" % os.environ.get("COMPUTERNAME", "?"))
        f.write("time: %s\n\n" % datetime.now(timezone.utc).astimezone().isoformat())
        for r in rows:
            f.write("%-40s %6d  %s  %s/%s\n" % (r["filename"], r["bytes"],
                                                r["sha256"], r["oem_id"], r["oem_table_id"]))


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "acpi-registry")
