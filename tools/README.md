# tools

Small helpers used to build, verify and publish this workbook. Plain Python 3,
no third-party dependencies (except where noted).

| tool | what it does |
|---|---|
| `ac-matrix.py` | the AC 4-state harness: writes `SEFM`/`SEPL` via `acpi_call`, settles, runs sysbench, samples RAPL/thermal at 1 Hz, emits `*.csv` + `.csv.meta` + `.csv.windows` + `summary.csv` + `run.log`. See `../docs/METHOD.md`. |
| `check-personal-info.py` | pre-publish gate: fails if a captured dump carries machine-identifying data (MSDM body, serials/UUIDs, host name, product-key shape, user paths). Run before every push. |
| `scrub-personal-info.py` | the matching idempotent scrubber. Also used as the tree filter when rewriting git history, so no revision carries the originals. |
| `check-doc-numbers.py` | recomputes every figure in the README tables from `linux/ac-4state/summary.csv` and `windows/summary.csv` and fails on a mismatch — the headline results are deliberately repeated on two landing pages, so this turns that into a checked invariant instead of a drift risk. |

`check-doc-numbers.py` is the second gate: run it after touching any result table.

Both `*-personal-info.py` tools match on shapes only — they contain none of
the values they remove, so they are safe to publish themselves.

Windows-side tooling is kept next to its evidence:
`../windows/tools/README.md` (including the provenance and
hashes of the two third-party `.bin` modules).

None of these tools contains credentials or hard-coded local paths.
