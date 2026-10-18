#!/usr/bin/env python3
# SPDX-License-Identifier: CC-BY-4.0
"""Keep the tables in the READMEs honest.

The headline results are deliberately repeated: the root README shows them so a
visitor sees the answer immediately, `linux/README.md` shows them so the Linux
directory explains itself, and `windows/README.md` shows the Windows ones. This
script turns that duplication into a checked invariant -- it recomputes every
figure from the raw summaries and fails if a README disagrees.

    tools/check-doc-numbers.py            # from the repository root
    tools/check-doc-numbers.py --verbose

Exit codes: 0 consistent, 1 mismatch (details on stdout).
"""

import csv
import pathlib
import statistics
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
AC_SUMMARY = ROOT / "linux/ac-4state/summary.csv"
WIN_SUMMARY = ROOT / "windows/summary.csv"
WALL_METER = ROOT / "windows/power/wall-meter.csv"

# EC state -> the two booleans (SEFM, SEPL) as they appear in the README tables
EC_STATES = {
    "active-locked": (0, 1),
    "quiet-locked": (1, 1),
    "active-unlimited": (0, 0),
    "quiet-unlimited": (1, 0),
}

AC_DOCS = ["README.md", "linux/README.md"]
WIN_DOCS = ["windows/README.md"]

PROBLEMS: list[str] = []


def read_csv(path):
    with path.open(newline="", encoding="utf-8") as fh:
        return list(csv.DictReader(fh))


def round2(value: float) -> float:
    """Round half up, the way the tables were written by hand."""
    return float(f"{value + 1e-9:.2f}")


def ac_expected() -> dict:
    """Per EC state: (score, pkg W, pkg max °C) recomputed from the campaign."""
    rows = read_csv(AC_SUMMARY)
    out = {}
    for state in EC_STATES:
        mine = [r for r in rows if r["state"] == state]
        if not mine:
            PROBLEMS.append(f"{AC_SUMMARY}: no rows for state {state}")
            continue
        score = int(round(statistics.median(float(r["sysbench_e_per_s"]) for r in mine)))
        pkg = round2(statistics.median(float(r["pkg_w"]) for r in mine))
        temp = max(int(r["pkg_max_mdegC"]) for r in mine) // 1000
        out[state] = (score, pkg, temp)
    return out


def win_expected() -> dict:
    """Per Windows state: (pkg W, pkg max °C, wall range or None)."""
    out = {}
    for r in read_csv(WIN_SUMMARY):
        if not r["pkg_w_median"]:
            continue
        out[r["state"]] = (round2(float(r["pkg_w_median"])), int(r["temp_c_max"]), None)
    if WALL_METER.exists():
        for r in read_csv(WALL_METER):
            if not r["load"].lower().startswith("y"):
                continue
            state = r["state"]
            if state in out and r["wall_w_low"] and r["wall_w_high"]:
                pkg, temp, _ = out[state]
                out[state] = (pkg, temp, (float(r["wall_w_low"]), float(r["wall_w_high"])))
    return out


def cells(line: str) -> list[str]:
    out = []
    for c in line.strip().strip("|").split("|"):
        out.append(c.strip().strip("*").strip().strip("`").strip())
    return out


def check_ac(docs, expected) -> None:
    for doc in docs:
        path = ROOT / doc
        text = path.read_text(encoding="utf-8")
        seen = set()
        for line in text.splitlines():
            if "SEFM" not in line or not line.strip().startswith("|"):
                continue
            c = cells(line)
            if len(c) < 5:
                continue
            booleans = [int(n) for n in __import__("re").findall(r"SEFM (\d) SEPL (\d)", line)[0]]
            state = next((s for s, b in EC_STATES.items() if list(b) == booleans), None)
            if state is None:
                PROBLEMS.append(f"{doc}: unknown EC state in '{c[0]}'")
                continue
            seen.add(state)
            score, pkg, temp = expected[state]
            got = (c[2], c[3], c[4])
            want = (str(score), f"{pkg:.2f}", str(temp))
            if got != want:
                PROBLEMS.append(f"{doc}: {state}: table says {got}, summary says {want}")
            elif "--verbose" in sys.argv:
                print(f"  ok  {doc}: {state} {got}")
        missing = set(expected) - seen
        if missing:
            PROBLEMS.append(f"{doc}: no row for {sorted(missing)}")


def check_windows(docs, expected) -> None:
    for doc in docs:
        path = ROOT / doc
        text = path.read_text(encoding="utf-8")
        seen = set()
        for line in text.splitlines():
            if not line.strip().startswith("|"):
                continue
            c = cells(line)
            if len(c) < 6 or c[0] not in expected:
                continue
            state = c[0]
            seen.add(state)
            pkg, temp, wall = expected[state]
            got = (c[3], c[4], c[5].replace("\u2013", "-").replace("\u2014", "-"))
            want_wall = f"{wall[0]:.1f}-{wall[1]:.1f}" if wall else c[5]
            want = (f"{pkg:.2f}", str(temp), want_wall)
            if got != want:
                PROBLEMS.append(f"{doc}: {state}: table says {got}, summary says {want}")
            elif "--verbose" in sys.argv:
                print(f"  ok  {doc}: {state} {got}")
        missing = set(expected) - seen
        if missing:
            PROBLEMS.append(f"{doc}: no row for {sorted(missing)}")


def main() -> int:
    print("checking the README tables against the raw summaries")
    check_ac(AC_DOCS, ac_expected())
    check_windows(WIN_DOCS, win_expected())
    for problem in PROBLEMS:
        print("MISMATCH:", problem)
    if PROBLEMS:
        print(f"\nFAIL: {len(PROBLEMS)} mismatch(es).", file=sys.stderr)
        return 1
    print("OK: every documented figure matches linux/ac-4state/summary.csv and windows/summary.csv.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
