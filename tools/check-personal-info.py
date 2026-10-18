#!/usr/bin/env python3
# SPDX-License-Identifier: CC-BY-4.0
"""Pre-publish gate: fail if a captured dump still carries machine-identifying
data.  Run before every push.

    tools/check-personal-info.py [path ...]      # default: the whole tree

Exit codes: 0 clean, 1 findings.  Matches on shapes only, so this file itself
contains no personal data.
"""

import gzip
import re
import sys
import tarfile
from pathlib import Path

TEXT_SUFFIXES = {".txt", ".md", ".csv", ".log", ".dsl", ".cff"}
# Values that identify no particular machine.
PLACEHOLDER_VALUES = {
    "", "null", "none", "not specified", "no asset tag", "unknown",
    "to be filled by o.e.m.", "filled by o.e.m.", "default string",
    "0", "00000000", "0123456789", "20000000", "9876543210",
}

FINDINGS: list[str] = []

PRODUCT_KEY = re.compile(rb"[A-Z0-9]{5}(?:-[A-Z0-9]{5}){4}")

# Same hexdump formats as the scrubber; keys straddle lines there.
HEXDUMP_LINE = re.compile(
    r"^(?P<pre>\s*(?P<off>[0-9A-Fa-f]{4,16})(?::|\s{2,}))"
    r"(?P<hex>(?:[0-9A-Fa-f]{2}(?: |$))+)"
    r"(?P<gap>\s*)"
    r"(?P<ascii>[ -~]*)$"
)


def hexdump_key_lines(text):
    """Line numbers where a hexdump block reassembles into a product key."""
    hits = []
    prev_end = None
    data = bytearray()
    first_line = None
    for i, line in enumerate(text.splitlines(), 1):
        m = HEXDUMP_LINE.match(line)
        if not m:
            data, prev_end, first_line = bytearray(), None, None
            continue
        off = int(m.group("off"), 16)
        if prev_end is not None and off != prev_end:
            data, first_line = bytearray(), None
        if first_line is None:
            first_line = i
        data.extend(bytes.fromhex(m.group("hex")))
        prev_end = off + len(m.group("hex").split())
        if PRODUCT_KEY.search(bytes(data)):
            hits.append(first_line)
            data = bytearray()
            prev_end = None
            first_line = None
    return hits


def flag(path: Path, line: int, what: str, text: str = "") -> None:
    detail = f": {text.strip()[:80]}" if text.strip() else ""
    FINDINGS.append(f"{path}:{line}: {what}{detail}")


def check_acpidump(path: Path, text: str) -> None:
    lines = text.splitlines()
    for i, line in enumerate(lines):
        if line.startswith("MSDM @"):
            for j in range(i + 1, min(i + 3, len(lines))):
                if re.match(r"^\s*[0-9A-Fa-f]{4}: ", lines[j]):
                    flag(path, j + 1, "MSDM (OEM activation) table body present")
                    break


def check_dmidecode(path: Path, text: str) -> None:
    for i, line in enumerate(text.splitlines(), 1):
        m = re.match(r"^\s*(Serial Number|UUID|Asset Tag):\s*(.*?)\s*$", line)
        if m and m.group(2).lower() not in PLACEHOLDER_VALUES:
            if m.group(2) == "<redacted>":
                continue
            flag(path, i, f"non-placeholder {m.group(1)}", m.group(2))


def check_text(path: Path, text: str) -> None:
    for i, line in enumerate(text.splitlines(), 1):
        if re.search(r"[A-Z0-9]{5}(-[A-Z0-9]{5}){4}", line):
            flag(path, i, "OEM product-key shape", line)
        if re.search(r"WIN-[A-Z0-9]{12}", line):
            flag(path, i, "Windows auto-generated host name", line)
        if re.search(r"(^|[/\\])home/[a-z0-9_-]+/|C:\\Users\\", line):
            flag(path, i, "user path", line)
        m = re.match(r"^\s*host:\s*(\S.*?)\s*$", line)
        if m and m.group(1) != "<redacted>":
            flag(path, i, "captured host name", m.group(1))


def check_binary(path: Path) -> None:
    """Archives and firmware tables can hide a key that no text scan sees."""
    raw = path.read_bytes()
    if raw[:2] == b"\x1f\x8b":
        try:
            if tarfile.is_tarfile(path):
                with tarfile.open(path, "r:gz") as tf:
                    for m in tf.getmembers():
                        if not m.isfile():
                            continue
                        data = tf.extractfile(m).read()
                        if PRODUCT_KEY.search(data):
                            flag(path, 0, f"product key inside {m.name}")
            else:
                with gzip.GzipFile(path, "rb") as gz:
                    if PRODUCT_KEY.search(gz.read()):
                        flag(path, 0, "product key inside gzip member")
        except (OSError, tarfile.TarError):
            return
        return
    if PRODUCT_KEY.search(raw):
        flag(path, 0, "product key in binary table")


def check_file(path: Path) -> None:
    name = path.name.lower()
    if name.endswith((".bin", ".dat", ".gz", ".tgz", ".tar.gz")):
        check_binary(path)
        return
    if path.suffix.lower() not in TEXT_SUFFIXES and path.suffix != "":
        return
    try:
        text = path.read_text(encoding="utf-8")
    except (UnicodeDecodeError, OSError):
        return
    if "acpidump" in name:
        check_acpidump(path, text)
    if "dmidecode" in name:
        check_dmidecode(path, text)
    check_text(path, text)
    for line in hexdump_key_lines(text):
        flag(path, line, "product key split across hexdump lines")


def main(argv: list[str]) -> int:
    roots = [Path(a) for a in argv[1:]] or [Path(".")]
    for root in roots:
        paths = [root] if root.is_file() else sorted(root.rglob("*"))
        for p in paths:
            if p.is_file() and ".git" not in p.parts:
                check_file(p)
    for f in FINDINGS:
        print(f)
    if FINDINGS:
        print(f"\nFAIL: {len(FINDINGS)} personal-data finding(s) above.", file=sys.stderr)
        return 1
    print("OK: no machine-identifying data found.")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
