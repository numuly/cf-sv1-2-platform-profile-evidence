# CSV columns

The Linux sample files are intentionally headerless — they are written by the
harness one row per second and the header costs nothing but noise. This file is
the schema that goes with them. (The Windows sample files do carry a header.)

## Linux sample files — `linux/**/r*_*.csv`, `bat_*.csv`, `state_*.csv`

| # | column | unit | source |
|---|---|---|---|
| 1 | `epoch` | s | wall clock, seconds since the epoch |
| 2 | `rapl_energy_uj` | µJ | `/sys/class/powercap/intel-rapl:0/energy_uj` (monotonic counter) |
| 3 | `t_pkg` | m°C | thermal zone `x86_pkg_temp` |
| 4 | `t_tcpu` | m°C | EC-exported thermal zone `TCPU` |
| 5 | `t_sen1` | m°C | EC-exported thermal zone `SEN1` |

Package power is **not** a column: it is `Δ(column 2) / 1e6 / Δ(column 1)` —
see `../METHOD.md`, and mind the dropped-sample caveat there.

State naming in `r<round>_<state>.csv`: `active`/`quiet` is the fan policy
(`SEFM` 0/1), `locked`/`unlimited` is the TDP policy (`SEPL` 1/0).

## Linux companion files

| file | contents |
|---|---|
| `<sample>.csv.windows` | two epoch seconds: first and last sample of the load window |
| `<sample>.csv.meta` | pre/post EC context line (`AC`, `S0IX`, `PWRS`, `CEFM`, `EPLE`, profile), the sysbench score, `MSR 0x610` PL1/PL2, the state written |
| `summary.csv` | per-campaign table: `round, state, sysbench_e_per_s, pkg_w, pkg_max_mdegC` — `pkg_w` is the full-window average of that round |

## Windows sample files — `windows/**/r*_*.csv`

| column | unit | meaning |
|---|---|---|
| `epoch_ms` | ms | wall clock |
| `iso` | — | same instant, ISO-8601 with timezone |
| `label` | — | state label (`perf-cool`, `eff-quiet`, …) |
| `phase` | — | `idle` or `load` |
| `power_pkg_w` | W | package power (LibreHardwareMonitor) |
| `temp_pkg_c` | °C | package temperature |
| `temp_coremax_c` | °C | hottest core |
| `load_cpu_pct` | % | total CPU utilisation |
| `clk_coremax_mhz` | MHz | highest core clock (empty when the sensor was unavailable) |

`<sample>.csv.meta` (same `<name>.csv.meta` convention as on the Linux side)
holds the state, the EPP registry value and the capture window.
