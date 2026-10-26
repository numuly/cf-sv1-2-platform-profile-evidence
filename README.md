# CF-SV1-2 platform_profile — evidence

Measurements and the DMI entry for Panasonic **CF-SV1-2** in the
`panasonic-laptop` `platform_profile` series (RFC thread:
<https://lore.kernel.org/all/20261007190446.38862-1-alexyeo362@gmail.com/>).
The driver change lives in that series; this repository holds the measurements,
the proposed DMI entry and its build/load report.

## Results

| state (EC) | `platform_profile` | sysbench e/s | pkg W (median) | pkg max °C |
|---|---|---|---|---|
| `SEFM 0 SEPL 1` | `cool` | 8311 | 9.96 | 50 |
| `SEFM 1 SEPL 1` | `quiet` | 8272 | 9.95 | 60 |
| `SEFM 0 SEPL 0` | `performance` | 13070 | 26.32 | 84 |
| `SEFM 1 SEPL 0` | `custom` (not settable through the ABI) | 13153 | 25.63 | 88 |

3 rounds × 4 states, 60 s `sysbench cpu --threads=8`, 1 Hz RAPL, EPP=performance,
turbo on, `thermald` stopped. Method and limits: `docs/METHOD.md`.

* TDP toggle = power lever: ~10 W locked, ~26 W unlocked.
* Fan toggle = temperature lever: `quiet` ~10 °C hotter at equal power.
* On the same unit under Windows 11 the power lever is the OS EPP (~23 W package
  at EPP=0, ~6 W at EPP=100 — the same ballpark as Linux unlocked), with a wall
  peak of 34.7 W. All 15 firmware tables are byte-identical to the Linux dump.

## Layout

```
linux/       Linux measurements (README.md there)
windows/     Windows 11 measurements, same unit (README.md there)
driver/      CF-SV1-2 DMI entry, v4 build/load/round-trip report and logs
docs/        METHOD, COLUMNS, FAQ, TESTING
superseded/  retracted round-1 data
tools/       the measurement harness, the personal-data gate, the doc-number gate
```

To reproduce: `patch -p1 < driver/cf-sv1-platform_profile-quirk.patch` on top of
RFC v4 — recipe in `driver/README.md`, other models in `docs/TESTING.md`.

## Status

Upstream is at **v4** (2026-10-26); Alex confirmed the SV1 mapping
(`cool`/`quiet`/`performance`, reusing `quirk_cf_sr4`) and asked for the DMI
entry as its own patch on top of the series. The entry is rebased, built and
loaded, and the round-trip / `custom` / s2idle-resume tests are in
`driver/README.md`; the formal `Tested-by:` is being sent. Data state: tag
`v4-test-20261026` (the v3 measurement state remains `round-3-20261018`). The
round-1 AC table is retracted (`superseded/`).

## Notes

* Serial numbers, the MSDM table and host names were removed from the published
  captures (`tools/check-personal-info.py`).
* `driver/` is GPL-2.0-only, everything else CC-BY-4.0 (`REUSE.toml`); the two
  `windows/tools/*.bin` are third-party PawnIO modules.
