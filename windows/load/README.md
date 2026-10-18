# windows/load — the 2×2 EPP × fan matrix

Three rounds per state of (`EPP` 0/100) × (fan cool/quiet), 60 s of
`WinLoad.exe` (8 threads, xorshift64) each, 1 Hz logging.

| file | contents |
|---|---|
| `r<round>_<state>.csv` | 1 Hz samples, with a header (schema: `../../docs/COLUMNS.md`) |
| `r<round>_<state>.csv.meta` | state, EPP registry value, capture window |
| `summary.csv` | pooled per-state statistics (n, min, median, max) |

The reply's table is `../summary.csv` with the wall range collapsed into a
single column, plus the pure-AC peak row from `../power/peak/`; the raw meter
readings are in `../power/wall-meter.csv`.
The battery attempt (negative result) is in `../load-dc/`.
