# Linux measurements — CF-SV1-2 firmware path

Everything measured on Linux for the `platform_profile` discussion, in one
directory. Machine: Panasonic CF-SV1-2 (DMI `CFSV1-2`, board `CFSV1-2H`),
i5-1145G7, BIOS V2.00L23, kernel 7.0.0-38-generic (Ubuntu).

- instrument/settings/formulas: `../docs/METHOD.md`
- CSV column meanings: `../docs/COLUMNS.md`
- captured environment: `environment.txt`
- the driver-side build/load test: `../driver/`

## Result — corrected AC 4-state matrix

| state (EC) | `platform_profile` | sysbench e/s | pkg W (median) | pkg max °C |
|---|---|---|---|---|
| `SEFM 0 SEPL 1` | `cool` | 8311 | 9.96 | 50 |
| `SEFM 1 SEPL 1` | `quiet` | 8272 | 9.95 | 60 |
| `SEFM 0 SEPL 0` | `performance` | 13070 | 26.32 | 84 |
| `SEFM 1 SEPL 0` | `custom` (not settable via the ABI) | 13153 | 25.63 | 88 |

3 interleaved rounds × 4 states, 60 s `sysbench cpu --threads=8`, 1 Hz RAPL
sampling, EPP=performance, turbo on, no userspace governor, `thermald` stopped.
The TDP toggle is the power lever (~10 W vs ~26 W); **the fan toggle is a
temperature lever** at essentially equal package power. `MSR 0x610` reads
28/60 W in every run — the EC enforces its own limit.

## What is here

| directory | contents | status |
|---|---|---|
| `ac-4state/` | 3 rounds × 4 states: `r*.csv` samples (+ `.csv.meta`, `.csv.windows`), `summary.csv`, `run.log` | current — the table above |
| `battery-4state/` | the same matrix on battery, EPP pinned to performance (+ `summary.csv`) | current |
| `thermald/` | boot A/B capture showing the one-shot `_OSC` unlock (`README.md` annotates the raw logs) | current |
| `acpi/` | `ssdt2.dat` + decompiled `ssdt2.dsl` (the `SEFM`/`SEPL`/`IETM` AML), full `acpidump`, `dmidecode`, firmware baseline | evidence |
| `logs/` | per-session run logs (read-backs, scores, temps, suspend/resume) | evidence |
| `environment.txt` | kernel, tools, governor/EPP settings, and what was *not* recorded | — |

Retracted data is not kept here: it lives in `../superseded/` (round-1 AC table
and its raw runs), with an explanation of what remains usable.

## Method

Governor parked so the firmware owns the fan; per state: write `SEFM`/`SEPL`
via `acpi_call`, 30 s settle, 60 s load, 40 s cooldown, 1 Hz RAPL + thermal
sampling. State names: `active`/`quiet` = `SEFM` 0/1, `locked`/`unlimited` =
`SEPL` 1/0. Package power is `Δenergy / Δtime`, not `Δenergy / count` (the
sampler drops ticks). Full detail and caveats: `../docs/METHOD.md`.

## thermald A/B (2026-10-16)

`thermald`'s first run since boot performs the one-shot `_OSC` unlock (TDP
locked → unlocked) and then leaves the profile alone: a `cool` write stayed put
for the whole 60 s observation window. Capture, annotation and the boot-transient
caveat: `thermald/`.

## Reproducibility anchors

- `acpi/ssdt2.dat` sha256 = `f0d92acf…` (the value quoted in the replies).
- The reply's AC table is the median of the rounds in `ac-4state/summary.csv`.
- Raw 1 Hz samples for every run are included here.

## Personal data

The captures are published as evidence, not as a machine fingerprint: the
MSDM table (OEM Windows activation data) was removed from
`acpi/acpidump-20261016.txt` and masked inside `acpi/acpi-tables-20261016.tar.gz`,
and the machine serials/UUID are redacted in `acpi/dmidecode-20261016.txt`.
`../tools/check-personal-info.py` is the gate that keeps it that way.

## Windows

The same unit was later re-imaged to Windows 11 and measured there; that
evidence is a sibling directory: `../windows/`.
