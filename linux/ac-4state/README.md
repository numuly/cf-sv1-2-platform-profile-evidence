# ac-4state — corrected AC matrix

The current, corrected AC 4-state measurement (2026-10-16): 3 interleaved rounds
of (`SEFM` × `SEPL`), 60 s sysbench each, 1 Hz RAPL + thermal sampling, EPP
performance, `thermald` stopped.

| file | contents |
|---|---|
| `r<round>_<state>.csv` | 1 Hz samples (schema: `../../docs/COLUMNS.md`) |
| `r<round>_<state>.csv.meta` | per-run context: EC read-back, sysbench score, `MSR 0x610` |
| `r<round>_<state>.csv.windows` | the load window, as two epoch seconds |
| `summary.csv` | per-round scores and power — **the table in the thread quotes the median of the rounds** |
| `run.log` | the session log (read-backs, scores, temperatures) |

Package power is `Δenergy / Δtime`, not `Δenergy / sample_count` — read
`../../docs/METHOD.md` before recomputing.

The retracted round-1 table and its raw runs are in `../../superseded/`.
