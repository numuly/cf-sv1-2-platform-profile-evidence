# Early AC sessions (2026-10-11) — superseded

Two sessions from the first day of measurements, before the corrected AC
campaign (`../../linux/ac-4state/`) existed. Kept only so the earlier notes stay
checkable; **do not cite any power number from here.**

| item | what it is |
|---|---|
| `samples-20261011-144945/` | four states sampled on AC, 1 Hz, `state_<SEFM>_<SEPL>.csv` (+ `.csv.windows`) |
| `perf2-20261011-153148/` | the same-day re-run with EPP pinned, two states |
| `early-sessions-run.log` | session log: read-backs, sysbench scores, temps |
| `early-sessions-perf2.log` | log of the re-run |

Why they are superseded: the AC power columns from that day are not usable for
the TDP-toggle question — this is the same lesson that made the round-1 table
wrong (see `../README.md`). Their package power reads ~5–6 W in every state,
which says more about the EPP/governor condition of that session than about the
firmware toggle.

Notes:

* these files have **no `.csv.meta`** — the per-run context (EC read-back,
  sysbench score, PL1/PL2) was only kept in the two `.log` files here;
* the fan-vs-temperature comparison within a fixed TDP state is the one part
  that survives, because both arms shared the session condition;
* the corrected, current matrix is `../../linux/ac-4state/summary.csv`.
