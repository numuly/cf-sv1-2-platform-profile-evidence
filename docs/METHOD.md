# Method — how every number in this repository was produced

The tables can be recomputed from the raw CSVs. Where something was not
recorded at the time it is listed under "Not recorded" rather than guessed.

## Linux side (`linux/`)

**Hardware, firmware, software.** Captured once, where it belongs, and not
repeated here: `../linux/environment.txt` for the measurement session (machine,
BIOS, kernel, tools, EC/RAPL paths) and `../windows/environment.txt` for the
Windows one.

**What is being measured.** The firmware's own fan/TDP policy, reached by the
two EC booleans the RFC maps:

* `SEFM`/`CEFM` — fan policy write/read (active = 0, passive = 1)
* `SEPL`/`EPLE` — TDP policy write/read (locked = 1, unlocked = 0)

written straight to the EC through `acpi_call` (`/proc/acpi/call`,
`\_SB_.PC00.LPCB.EC0_`). This isolates the firmware path from the driver
under discussion. `CEFM`/`EPLE` are read back after every write; a run whose
read-back did not match was discarded (none were).

**Held for every run** (the captured values are in `../linux/environment.txt`):
the userspace fan governor is parked (`mode=system`, `TFN1._FSL` released) so
the firmware owns the fan — otherwise a profile write is masked; EPP =
`performance` with turbo enabled; `thermald` stopped (its one-shot `_OSC`
unlock is measured separately in `../linux/thermald/`); and no userspace power
daemon was re-applying the profile.

**Sequence per state**

1. write `SEFM`/`SEPL` via `acpi_call`;
2. 30 s idle settle (cooling to a comparable starting temperature);
3. 60 s load: `sysbench cpu --threads=8 --time=60`;
4. 40 s cooldown;
5. 3 interleaved rounds, 4 states each.

**Sampling.** 1 Hz, three sources recorded per sample:

* package energy: `/sys/class/powercap/intel-rapl:0/energy_uj` (microjoules,
  monotonically rising counter);
* package temperature and the two EC thermal zones (`x86_pkg_temp`, `TCPU`,
  `SEN1`) in millidegrees C;
* per run, pre/post EC context (`AC`, `SIOX`/`S0IX`, `PWRS`, `CEFM`, `EPLE`),
  the sysbench score and `MSR 0x610` (RAPL PL1/PL2) into the `.meta` file.

**Package power formula.**

```
pkg_W = (energy_uj[last] - energy_uj[first]) / 1e6 / (epoch[last] - epoch[first])
```

i.e. energy delta divided by the **time actually spanned by the recorded
samples**, *not* by the number of samples. The sampler occasionally drops a
tick, so a 60 s run holds 59–60 rows; dividing by the row count instead of the
timestamp span reads about 1.7 % low (9.95 instead of 10.12 W in the locked
states) and is how a recomputation can appear to disagree with the tables.

The load window is also recorded separately per run in the `.csv.windows`
file (two epoch seconds: first and last sample of the load), so the window can
be reproduced without guessing.

**Aggregation.** `summary.csv` per campaign keeps every round; the tables in
the replies quote the median of the rounds (power and score) and the
maximum temperature over the state's rounds. Medians, not means: the
interesting variation is "quiet runs hotter", and one 88 °C outlier would drag
a mean.

**Temperature.** "pkg max °C" is the highest `x86_pkg_temp` over the load
window of each round; the per-round values are in `summary.csv` and the `.meta`
files, so the spread is visible.

## Windows side (`windows/`)

* Logger: LibreHardwareMonitor 0.9.6 with PawnIO 2.2.0, 1 Hz, package power and
  package temperature.
* Load: `WinLoad.exe`, 8 threads of an xorshift64 integer loop, 60 s. Deliberately
  not sysbench, so the absolute wattage is only a qualitative comparison
  with the Linux runs; the meaningful comparison is Windows vs Linux on the same
  unit.
* Power lever under Windows is the OS EPP (`powercfg`), not `SEPL`: EPP=0 and
  EPP=100 are the two arms, crossed with the Panasonic `FanControl.Mode`
  (cool/quiet).
* Wall input power: a plug-in meter on the AC input, read as a range while the
  state was held at steady load (`../windows/power/wall-meter.csv`).
* Aggregation: median over the pooled load samples of 3 rounds per state; max
  package temperature over all samples of the state.

## Not recorded (fix on the next capture)

The single list of what was not captured — it is kept here, next to the method it
affects, rather than repeated in the environment captures. None of these change a
conclusion, but they are the first things a reviewer asks about:

* exact `sysbench` version and build;
* exact `thermald` version;
* the OS point release, and `apt` versions beyond `iasl 20251212`;
* the raw `lscpu` / `uname -a` / `lsmod` of the measurement session (the kernel
  string in `../linux/environment.txt` is taken from the run logs);
* wall-meter model, resolution and sampling interval (readings are given as
  ranges, e.g. 34.5–35.5 W);
* room/ambient temperature during the runs (the 30 s settle and 40 s cooldown
  were used to make the starting condition comparable, but ambient is not
  logged);
* the EC's own `TFN1._FSL` value at each sample (it was verified released before
  each campaign, not sampled per second).
