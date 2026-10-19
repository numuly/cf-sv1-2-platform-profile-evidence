# Windows comparison — CF-SV1-2 (2026-10-18)

The unit was re-imaged from Linux to Windows 11 to answer Alex's request in the
RFC thread: run a comparable 8-thread load under Windows with package power and
temperature logging, and dump the ACPI tables from that side.

On Windows the power lever is the OS EPP, not the EC boolean: EPP=0 draws
~23 W package / ~35 W wall, EPP=100 draws ~6 W / ~13 W. The Panasonic fan mode
only moves temperature (~5 °C at equal power), and this unit shows no large
power spike (34.7 W wall peak with the battery removed). All 15 firmware tables
are byte-identical to the Linux dump, so the BIOS update changed nothing.

## What is here

| path | contents |
|---|---|
| `summary.csv` | the numbers in the reply's table: package power per state plus the wall range (the mail collapsed it to one column and appended the peak row) |
| `load/` | the 2×2 EPP × fan matrix — `r*.csv` samples (+ `.csv.meta`), per-round `summary.csv` |
| `load-dc/` | the same matrix on battery — a negative result, kept for the record (`README.md`) |
| `power/` | `wall-meter.csv`, the AC peak trace (`peak/`), barrel vs USB-C PD (`pd/`) |
| `acpi/` | the full table dump (`registry/`), the API enumeration (`firmware-api/`), the Linux-vs-Windows comparison |
| `tools/` | the scripts used, plus the two third-party PawnIO modules (provenance + hashes in `tools/README.md`) |
| `environment.txt` | the full environment capture |
| `ec-investigation.txt` | how the EC path was traced — why the four Linux states cannot be reproduced here |

## Environment

| | |
|---|---|
| machine | Panasonic CF-SV1-2 (DMI `CFSV1-2`), i5-1145G7, board `CFSV1-2H` |
| OS | Windows 11 Pro, build 26300 |
| BIOS | V2.00L24 (upgraded from the V2.00L23 used for the Linux dump) |
| power | AC, battery 99 % (`CF-VZSU1C`) |
| logging | LibreHardwareMonitor 0.9.6 (PawnIO 2.2.0), 1 Hz |
| load | `WinLoad.exe`: 8 threads, xorshift64 integer loop, 60 s |

`environment.txt` has the full capture (system, power, Panasonic, tools, EC
baseline, MSR 0x610).

## ACPI dump from Windows

`GetSystemFirmwareTable()` cannot return more than the first table of a
duplicated signature, so it is not enough for the 12 SSDTs.  Two sources are
combined:

* `acpi/registry/` — the kernel's own copy in `HKLM\HARDWARE\ACPI`
  (`SSD1..SSDB`, `SSDT`, `DSDT`, `FADT`, `FACS`, `RSDT`).  This is the only
  user-mode source that yields every firmware SSDT.  Dumped by
  `tools/acpi_registry_dump.py`.
* `acpi/firmware-api/tables.csv` — what `GetSystemFirmwareTable('ACPI')` does
  return, i.e. the enumeration with the duplicated SSDT IDs.  The raw API dump
  itself is not kept: it only repeats the registry tables (and the non-AML
  tables that the Linux dump already has).

`acpi/compare-linux-windows.txt` pairs the Windows tables with the pre-Windows
Linux dump (`linux/acpi/acpi-tables-20261016.tar.gz`):

* all 15 firmware tables match byte-for-byte (DSDT, FACP, FACS, and all 12
  SSDTs), including the Panasonic `DptfTabl` SSDT that carries the
  `CEFM/SEFM/EPLE/SEPL` AML — sha256 `f0d92acf…`, the same anchor the LKML
  replies quote;
* the BIOS V2.00L23 → V2.00L24 update therefore did not change any ACPI
  table on this unit;
* Linux additionally has the 8 runtime `dynamic/SSDT*` tables, which are
  loaded by the ACPI interpreter and are not in the firmware registry.

The Windows DSDT (`acpi/registry/DSDT_01_CFSV1-2.bin`) was decompiled with
ACPICA `iasl` 20260408.  It confirms the same call chain the SSDT references:

```
EC0.SEFM/SEPL -> REFM/REPL -> EC88
EC88 -> EC86 (ECST==0, ASRV mailbox + SMI on port 0xB2)
     -> EC87 (ECST!=0, direct EC RAM 0x04..0x07)
```

On this Windows install `ECST` is 1 (the `_REG` handler installed), but writing
EC RAM 0x04..0x07 directly (the EC87 path) has no effect (verified), while the
Panasonic stack changes the EC state.  The firmware SMI path is not reachable
from user mode, so the `SEPL` lock that the Linux harness applied with
`acpi_call` cannot be reproduced here.  Windows therefore runs the EC in its
boot/default TDP state; its power lever is the OS EPP.

## Measurement matrix

The Linux 4-state matrix toggled the two EC booleans (`SEFM`, `SEPL`) at a fixed
EPP.  Windows does not expose those from user mode, so the closest honest
comparison uses the two levers Windows *does* expose:

| lever | values |
|---|---|
| OS power | `EPP = 0` (performance) vs `EPP = 100` (efficiency), overlays disabled |
| fan | Panasonic `FanControl.Mode = cool` vs `quiet` (EC fan policy) |

Per state: 30 s settle → 60 s 8-thread load with 1 Hz LHM sampling → 45 s
cooldown; 3 interleaved rounds.  `load/` holds the raw CSVs,
per-run `.meta` (EC registers, MSR 0x610, EPP, fan mode, battery) and
`summary.csv`.  `power/wall-meter.csv` holds the wall-plug readings.

## Results

Median over 3 rounds × ~60 load samples per state; wall values are the range
read on a wall plug meter while the state was held at steady load
(`power/wall-meter.csv`).

| state | EPP | fan | pkg W (median) | pkg max °C | wall W |
|---|---|---|---|---|---|
| `perf-cool` | 0 | cool | 22.96 | 74 | 34.5–35.5 |
| `perf-quiet` | 0 | quiet | 23.06 | 79 | 29.6–30.2 |
| `eff-cool` | 100 | cool | 5.95 | 44 | 12.6–13.0 |
| `eff-quiet` | 100 | quiet | 6.04 | 44 | 12.5–12.8 |
| idle | 0 | cool | – | – | 8.0–9.0 |


* The power lever on Windows is the OS EPP, not the EC `SEPL` lock. EPP=0
  draws ~23 W package / ~35 W wall; EPP=100 draws ~6 W package / ~13 W wall
  under the same 8-thread load. `MSR 0x610` stays 28 W / 60 W in every run and
  the EC `0xCA/0xCB` registers never move, so the RAPL MSR and the EC PL table
  are not what changes.
* The Panasonic fan mode is a temperature lever, not a power lever. At
  EPP=0 the package power is the same for `cool` and `quiet` (22.96 vs
  23.06 W) while `quiet` runs ~5 °C hotter (79 vs 74 °C). The wall power is
  *lower* with `quiet` (29.9 vs 35.0 W) because the slower fan itself draws
  less. At EPP=100 the package is ~6 W and the fan no longer matters.
* Windows does not exercise the EC TDP lock. The Linux harness's ~10 W
  `SEPL`-locked plateau is not produced by the Windows stack: it leaves the EC
  in its boot/default TDP state and moves power through EPP. Reproducing the
  Linux four-state matrix on Windows would need a signed driver able to
  evaluate the ACPI methods (the SMI path on port 0xB2); see
  `ec-investigation.txt`.

On both sides the fan toggle moves temperature rather than package power; on
Windows the power side is an OS policy (EPP), not the EC `SEPL` boolean.

## Peak / spike (AC only, no battery)

The thread asked for Windows thermal/power data and reports SR4 spikes of
~60 W on the AC charger and ~80 W on a 100 W USB-C PD charger.
The SR4 is a different CPU (i5-1345U) with its own power configuration, so the
absolute numbers are not comparable across models; the meaningful comparison
is Windows vs Linux on the same unit.  On this CF-SV1-2 the platform does not
spike like that:

| measurement | value |
|---|---|
| package peak (100 ms sampling, 300 s load) | 29.7 W |
| package median | 23.7 W |
| max package temp | 82 °C |
| wall peak/hold | 34.7 W |
| wall steady | ~35 W |

The wall peak equals the steady value, so there is no large CPU spike: the
platform caps package power at ~30 W on AC.  (An earlier 62 W wall peak was
battery charging at ~22 W plus the load; with the battery removed and pure AC
the peak is 34.7 W.)  File: `power/peak/peak_aconly.csv` (100 ms).

## Supply comparison: barrel vs USB-C PD (2026-10-18)

The unit has Thunderbolt 4 / UCSI, so it runs from either the barrel charger or
a USB-C PD charger.  Both were measured with the same meter on the AC input,
same 8-thread load (EPP=0, fan cool), 100 ms package trace:

| supply | AC real power | AC V / A | pkg peak | pkg median | max temp |
|---|---|---|---|---|---|
| barrel charger | 30.9-31.4 W | 227 V / 0.307 A | 30.64 W | 20.4 W | 80 C |
| 120 W USB-C PD | 30.8-31.2 W | 228 V / 0.175 A | 30.95 W | 20.2 W | 80 C |

The two are effectively identical: this unit gets no extra headroom from PD and
there is no SR4-style ~80 W PD spike.  Raw: `power/pd/peak_pd.csv`,
`power/peak/peak_barrel_dlx.csv`.

## Battery-side (DC) comparison

The 2×2 matrix was repeated on battery to mirror the Linux `battery-4state`
session.  It did not produce a clean matrix, and the reason is the result:
Windows' DC processor settings throttle the package, and even with those pinned
the platform pulls sustained package power back to ~5 W (EC + Intel DPTF, not
EPP).  The attempt, its numbers and the DC-setting gotcha are kept in
`load-dc/README.md`; the AC matrix above is the comparison to use.

## Tools

| tool | what |
|---|---|
| `tools/acpi_registry_dump.py` | dump every ACPI table from `HKLM\HARDWARE\ACPI` |
| `tools/acpi_dump.py` | dump the non-AML tables via `GetSystemFirmwareTable` |
| `tools/compare_acpi.py` | pair Windows and Linux tables by sha256 |
| `tools/ec_pawnio.py` | EC RAM read/write over PawnIO `LpcACPIEC` (ports 0x62/0x66) |
| `tools/ec_state.py` | EC88/EC87 command layer + state read-back |
| `tools/msr_read.py` | MSR read over PawnIO `IntelMSR` |
| `tools/WinLoad.cs` | 8-thread load + 1 Hz LibreHardwareMonitor CSV logger |
| `tools/win_matrix.py` | orchestrates the 2×2 matrix |
| `tools/hold_state.py` | hold one state under load for a wall-meter reading |

The two PawnIO blobs (`LpcACPIEC.bin`, `IntelMSR.bin`) are the signed official
modules from the PawnIO.Modules 0.2.11 release; they are included so the scripts
run unchanged.

`tools/WinLoad.exe` is built from `tools/WinLoad.cs` (the binary is not
committed):

```powershell
csc /out:WinLoad.exe /r:LibreHardwareMonitorLib.dll WinLoad.cs
```

with `LibreHardwareMonitorLib.dll` from the LibreHardwareMonitor 0.9.6 package.
`tools/hold_state.py` holds one matrix state under load for a wall-meter
reading; `tools/win_matrix.py` is the orchestrator that produced
`load/`.
