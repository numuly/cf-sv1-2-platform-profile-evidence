# tools

Small helpers used to build, verify and publish this workbook. Plain Python 3,
no third-party dependencies (except where noted).

| tool | what it does |
|---|---|
| `ac-matrix.py` | the AC 4-state harness: writes `SEFM`/`SEPL` via `acpi_call`, settles, runs sysbench, samples RAPL/thermal at 1 Hz, emits `*.csv` + `.csv.meta` + `.csv.windows` + `summary.csv` + `run.log`. See `../docs/METHOD.md`. |
| `lkml-reply.py` | build (default) or send a threaded reply as an RFC822 message; optionally IMAP-APPEND a copy to "Sent". The password is read from `getpass` or an env var (`--password-env` / `--imap-password-env`), never from the command line. |
| `lore-check.py` | check a Message-ID is archived on lore.kernel.org via NNTP (lore's HTTP is behind Anubis, which answers with 200 and a challenge page, so a status code proves nothing). Can diff the archived body against a local copy. |
| `check-personal-info.py` | pre-publish gate: fails if a captured dump carries machine-identifying data (MSDM body, serials/UUIDs, host name, product-key shape, user paths). Run before every push. |
| `scrub-personal-info.py` | the matching idempotent scrubber. Also used as the tree filter when rewriting git history, so no revision carries the originals. |
| `check-doc-numbers.py` | recomputes every figure in the README tables from `linux/ac-4state/summary.csv` and `windows/summary.csv` and fails on a mismatch — the headline results are deliberately repeated on two landing pages, so this turns that into a checked invariant instead of a drift risk. |

`check-doc-numbers.py` is the second gate: run it after touching any result table.

Both `*-personal-info.py` tools match on shapes only — they contain none of
the values they remove, so they are safe to publish themselves.

Note: `lore-check.py` uses the stdlib `nntplib`, which was **removed in
Python 3.13**; run it under Python ≤ 3.12, or replace the NNTP calls with a raw
socket client. NNTP itself is unaffected by Anubis.

Windows-side tooling is kept next to its evidence:
`../windows/tools/README.md` (including the provenance and
hashes of the two third-party `.bin` modules).

None of these tools contains credentials or hard-coded local paths.
