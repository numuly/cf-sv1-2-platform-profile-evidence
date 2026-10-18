# CF-SV1-2 platform_profile — evidence

Evidence for CF-SV1-2 in the `panasonic-laptop` `platform_profile` series, from
the RFC thread:
<https://lore.kernel.org/all/20261007190446.38862-1-alexyeo362@gmail.com/>

The driver change is in that series. Here: the measurements, the DMI entry we
propose for CF-SV1-2, and the build/load test of it.

## Results

| state (EC) | `platform_profile` | sysbench e/s | pkg W (median) | pkg max °C |
|---|---|---|---|---|
| `SEFM 0 SEPL 1` | `cool` | 8311 | 9.96 | 50 |
| `SEFM 1 SEPL 1` | `quiet` | 8272 | 9.95 | 60 |
| `SEFM 0 SEPL 0` | `performance` | 13070 | 26.32 | 84 |
| `SEFM 1 SEPL 0` | `custom` | 13153 | 25.63 | 88 |

3 rounds × 4 states, 60 s `sysbench cpu --threads=8`, 1 Hz RAPL, EPP=performance,
turbo on, `thermald` stopped. Method and limits: `docs/METHOD.md`.

* TDP toggle = power lever: ~10 W locked, ~26 W unlocked.
* Fan toggle = temperature lever: `quiet` ~10 °C hotter at equal power.
* Same unit under Windows 11: EPP is the lever (~23 W at 0, ~6 W at 100), wall
  peak 34.7 W — same ballpark as Linux.

## Layout

```
linux/       Linux measurements (README.md there)
windows/     Windows 11 measurements, same unit (README.md there)
driver/      proposed DMI entry + build/load report
docs/        METHOD, COLUMNS, FAQ, TESTING
superseded/  retracted round-1 data
tools/       harness + the two checks
```

To reproduce: `patch -p1 < driver/cf-sv1-platform_profile-quirk.patch` against
RFC v3 — recipe in `driver/README.md`, other models in `docs/TESTING.md`.

## State

v3 upstream, no v4. Three replies sent (10-12, 10-16, 10-18); `Tested-by:`
pending, the driver's `get()` after resume still untested. The round-1 AC table
is retracted (`superseded/`). Cite the tag `round-3-20261018`.

## License

`driver/` GPL-2.0-only, everything else CC-BY-4.0 (`REUSE.toml`); the two
`windows/tools/*.bin` are third-party PawnIO modules.

## Personal data

Serial numbers, the MSDM table and host names were removed from the published
captures (`tools/check-personal-info.py`).
