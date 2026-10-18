# windows/power — input power

| file | contents |
|---|---|
| `wall-meter.csv` | wall-plug readings per state (range while the state was held at load), plus the pure-AC peak |
| `peak/peak_aconly.csv` | the 100 ms package trace with the battery removed (peak/hold 34.7 W) |
| `peak/peak_barrel_dlx.csv` | the same load on the barrel charger |
| `pd/peak_pd.csv` | the same load on a 120 W USB-C PD charger — no extra headroom, no SR4-style spike |

The meter model and its resolution were not recorded — see the "Not recorded"
list in `../environment.txt` and the plan in the issue tracker.
