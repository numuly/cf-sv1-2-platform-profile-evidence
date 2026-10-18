#!/usr/bin/env python3
"""Pair the Windows registry ACPI dump with the pre-Windows Linux dump.

The Windows dump comes from HKLM\\HARDWARE\\ACPI (acpi_registry_dump.py); the
Linux dump is linux/acpi/acpi-tables-20261016.tar.gz from the repo.
Firmware SSDTs must be byte-identical across the BIOS V2.00L23 -> V2.00L24
change; Linux also has the runtime "dynamic" SSDTs Windows does not expose.
"""
import hashlib
import os
import struct
import sys


def sig_of(path):
    with open(path, "rb") as f:
        return f.read(4).decode("ascii", "replace")


def sha(path):
    return hashlib.sha256(open(path, "rb").read()).hexdigest()


def main(win_dir, linux_dir, out):
    win = {fn: sha(os.path.join(win_dir, fn))
           for fn in sorted(os.listdir(win_dir)) if fn.endswith(".bin")}
    lin = {}
    for root, _, files in os.walk(linux_dir):
        for fn in files:
            p = os.path.join(root, fn)
            lin[os.path.relpath(p, linux_dir)] = sha(p)

    lines = []
    lines.append("Windows registry ACPI dump vs pre-Windows Linux dump")
    lines.append("")
    lines.append("%-34s %-30s %-9s %s" % ("windows", "linux", "size", "sha256 match"))
    lines.append("-" * 96)
    matched = 0
    for wfn in sorted(win):
        wpath = os.path.join(win_dir, wfn)
        wsize = os.path.getsize(wpath)
        wsha = win[wfn]
        cands = [l for l in lin if lin[l] == wsha]
        if cands:
            matched += 1
            lfn = cands[0]
            lines.append("%-34s %-30s %-9d %s" % (wfn, lfn, wsize, "YES"))
        else:
            lines.append("%-34s %-30s %-9d %s" % (wfn, "-", wsize, "no exact match"))
    lines.append("")
    lines.append("Windows tables: %d, exact sha matches with Linux: %d" % (len(win), matched))
    unpaired = [l for l in lin if lin[l] not in win.values()]
    lines.append("Linux-only (runtime/dynamic SSDTs, not in firmware registry):")
    for l in sorted(unpaired):
        lines.append("  %-40s %d bytes" % (l, os.path.getsize(os.path.join(linux_dir, l))))
    text = "\n".join(lines) + "\n"
    print(text)
    with open(out, "w") as f:
        f.write(text)


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3] if len(sys.argv) > 3 else "compare.txt")
