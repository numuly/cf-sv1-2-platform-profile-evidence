#!/usr/bin/env python3
# SPDX-License-Identifier: CC-BY-4.0
"""Scrub machine-identifying data from captured firmware dumps.

This is a *policy* script, not a record of what was removed: it matches on
patterns only and never contains the values themselves, so it is safe to
publish.  It is idempotent -- running it twice changes nothing the second time.

It is used twice:

  * on the working tree, to keep the published dumps clean;
  * during the git history rewrite (git filter-branch --tree-filter), so no
    revision of this repository carries the original values either.

What it removes:

  * the ``MSDM`` ACPI table body (OEM Windows activation data) from any
    ``*acpidump*.txt``, keeping the table header as a marker;
  * OEM product keys wherever they appear, including *inside* gzip/tar
    archives and binary firmware tables, masked in place so the table keeps its
    length;
  * serial numbers and UUIDs in any ``*dmidecode*.txt``, keeping firmware
    placeholder values (they identify nothing);
  * the captured host name in any dump header.

Usage:
    tools/scrub-personal-info.py [path ...]      # default: the whole tree
"""

import gzip
import io
import re
import sys
import tarfile
from pathlib import Path


# DMI values that are firmware placeholders or literally empty: they identify
# no particular machine, so they are left alone.
PLACEHOLDER_VALUES = {
    "",
    "null",
    "none",
    "not specified",
    "no asset tag",
    "to be filled by o.e.m.",
    "filled by o.e.m.",
    "default string",
    "0",
    "00000000",
    "0123456789",
    "20000000",
    "9876543210",
    "unknown",
}

DMI_LINE = re.compile(r"^(\s*)(Serial Number|UUID|Asset Tag)(:\s*)(.*?)\s*$")
MSDM_HEADER = re.compile(r"^MSDM @ ")
HEX_LINE = re.compile(r"^\s*[0-9A-Fa-f]{4}: ")
HOST_LINE = re.compile(r"^(\s*host:\s*)(\S.*?)\s*$", re.M)

MSDM_MARKER = "MSDM @ 0x0000000000000000  [body removed: OEM Windows activation data]\n"


def scrub_dmidecode(text: str) -> str:
    out = []
    for line in text.splitlines(keepends=True):
        m = DMI_LINE.match(line)
        if m and m.group(4).lower() not in PLACEHOLDER_VALUES:
            out.append(f"{m.group(1)}{m.group(2)}{m.group(3)}<redacted>\n")
        else:
            out.append(line)
    return "".join(out)


def scrub_acpidump(text: str) -> str:
    out = []
    skipping = False
    for line in text.splitlines(keepends=True):
        if MSDM_HEADER.match(line):
            skipping = True
            out.append(MSDM_MARKER)
            continue
        if skipping and HEX_LINE.match(line):
            continue
        skipping = False
        out.append(line)
    return "".join(out)


def scrub_host_line(text: str) -> str:
    return HOST_LINE.sub(lambda m: f"{m.group(1)}<redacted>\n", text)


PRODUCT_KEY = re.compile(rb"[A-Z0-9]{5}(?:-[A-Z0-9]{5}){4}")
# Lower case on purpose: the mask must not itself look like a product key.
KEY_MASK = b"xxxxx-xxxxx-xxxxx-xxxxx-xxxxx"


def mask_product_keys(data: bytes) -> bytes:
    """Mask OEM activation keys in place, keeping the byte length."""
    return PRODUCT_KEY.sub(KEY_MASK, data)


# One hexdump line of the two formats in this tree:
#   acpidump:  "    0030: 00 00 ... 46 4e  ...  ........ABCDE-FG"
#   custom:    "  00000030  00 00 ... 46 4e  ...  ........ABCDE-FG"
# A product key is 29 bytes, so it straddles two or three lines and is only
# findable by reassembling the block.
HEXDUMP_LINE = re.compile(
    r"^(?P<pre>\s*(?P<off>[0-9A-Fa-f]{4,16})(?::|\s{2,}))"
    r"(?P<hex>(?:[0-9A-Fa-f]{2}(?: |$))+)"
    r"(?P<gap>\s*)"
    r"(?P<ascii>[ -~]*)$"
)


def _hexdump_runs(lines):
    """Group consecutive hexdump lines (offsets must be contiguous)."""
    run = []
    prev_end = None
    for i, line in enumerate(lines):
        m = HEXDUMP_LINE.match(line.rstrip("\n"))
        if not m:
            if run:
                yield run
                run = []
            prev_end = None
            continue
        off = int(m.group("off"), 16)
        nbytes = len(m.group("hex").split())
        if run and off != prev_end:
            yield run
            run = []
        run.append((i, m, nbytes))
        prev_end = off + nbytes
    if run:
        yield run


def mask_key_in_hexdumps(text: str) -> str:
    """Mask product keys that are split across hexdump lines, in place."""
    lines = text.splitlines(keepends=True)
    changed = False
    for run in _hexdump_runs(lines):
        where = []
        data = bytearray()
        for i, m, nbytes in run:
            data.extend(bytes.fromhex(m.group("hex")))
            where.extend((i, b) for b in range(nbytes))
        matches = list(PRODUCT_KEY.finditer(bytes(data)))
        if not matches:
            continue
        changed = True
        by_line = {i: m for i, m, _ in run}
        for match in matches:
            for pos in range(match.start(), match.end()):
                i, b = where[pos]
                m = by_line[i]
                line = lines[i]
                hex_at = m.start("hex") + 3 * b
                line = line[:hex_at] + "78" + line[hex_at + 2:]
                ascii_at = m.start("ascii") + b
                if ascii_at < len(line):
                    line = line[:ascii_at] + "x" + line[ascii_at + 1:]
                lines[i] = line
    return "".join(lines) if changed else text



def scrub_binary(path: Path) -> bool:
    """Mask product keys in binary firmware tables and inside tarballs."""
    raw = path.read_bytes()
    if raw[:2] == b"\x1f\x8b":
        if not tarfile.is_tarfile(path):
            # plain gzip member (e.g. a decompiled DSDT): decompress, mask,
            # recompress keeping the original timestamp
            with gzip.GzipFile(path, "rb") as gz:
                data = gz.read()
                mtime = gz.mtime
            masked = mask_product_keys(data)
            if masked == data:
                return False
            path.write_bytes(gzip.compress(masked, mtime=mtime))
            return True
        with tarfile.open(path, "r:gz") as tf:
            members = []
            changed = False
            for m in tf.getmembers():
                if not m.isfile():
                    members.append((m, None))
                    continue
                data = tf.extractfile(m).read()
                masked = mask_product_keys(data)
                changed |= masked != data
                members.append((m, masked))
            if not changed:
                return False
        buf = io.BytesIO()
        with tarfile.open(fileobj=buf, mode="w:gz", format=tarfile.GNU_FORMAT) as out:
            for m, data in members:
                out.addfile(m, io.BytesIO(data) if data is not None else None)
        path.write_bytes(buf.getvalue())
        return True
    masked = mask_product_keys(raw)
    if masked != raw:
        path.write_bytes(masked)
        return True
    return False


def scrub_file(path: Path) -> bool:
    if path.is_symlink() or path.stat().st_size > 64 * 1024 * 1024:
        return False
    name = path.name.lower()
    if name.endswith((".bin", ".dat", ".gz", ".tgz", ".tar.gz")):
        return scrub_binary(path)
    try:
        text = path.read_text(encoding="utf-8")
    except (UnicodeDecodeError, OSError):
        return False
    new = text
    if "acpidump" in name:
        new = scrub_acpidump(new)
    if "dmidecode" in name:
        new = scrub_dmidecode(new)
    new = scrub_host_line(new)
    new = mask_key_in_hexdumps(new)
    if new != text:
        path.write_text(new, encoding="utf-8")
        return True
    return False


def main(argv: list[str]) -> int:
    roots = [Path(a) for a in argv[1:]] or [Path(".")]
    changed = []
    for root in roots:
        paths = [root] if root.is_file() else sorted(root.rglob("*"))
        for p in paths:
            if not p.is_file() or ".git" in p.parts:
                continue
            if scrub_file(p):
                changed.append(p)
    for p in changed:
        print(f"scrubbed {p}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
