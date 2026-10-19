# Superseded data — do not cite

Everything here was published in an earlier round and has been retracted.
It is kept only so the thread's history stays checkable.

| item | what it is |
|---|---|
| `summary-ac-round1-EPPpower.csv` | the AC table reported in round 1 (2026-10-12) |
| `ac-3rounds/` | the 12 raw runs behind that table |
| `early-sessions/` | earlier same-day AC runs, superseded by the corrected matrix |

## Why the round-1 AC table is unusable

It was measured with EPP=power (efficiency) plus a small thermal tool
re-applying that EPP, so its power columns are an artifact of that state.
Read them and you will conclude — wrongly — that the TDP toggle does nothing:
they show ~6.2 W in all four states, the opposite of what the corrected
measurements show.

- Retracted in round 2 (2026-10-16), corrected in round 3 (2026-10-18).
- Corrected, current data: `../linux/ac-4state/`
  (the table is `../linux/ac-4state/summary.csv`; the thread quotes its medians).
- What still survives from these runs: the *fan* comparison within a fixed TDP
  state, because both arms shared the EPP condition. The power comparison does
  not.
- The Windows side has its own negative result, which is not retracted and
  stays with its evidence: `../windows/load-dc/README.md`.

## Rule going forward

A retracted dataset is never overwritten in place — it is moved here, and the
directory it came from is renamed with a `SUPERSEDED` marker, so nobody can
stumble onto stale numbers under a fresh-sounding name.
