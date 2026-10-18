# Windows-side tools

Everything here was used to produce `../load/`, `../load-dc/`, `../power/` and `../acpi/`. Plain
Python 3 and .NET, no private code, no credentials.

## Scripts

| tool | what it does |
|---|---|
| `acpi_registry_dump.py` | dumps every ACPI table from `HKLM\HARDWARE\ACPI` (the only user-mode source that yields all 12 SSDTs, unlike `GetSystemFirmwareTable`) |
| `acpi_dump.py` | enumerates what `GetSystemFirmwareTable('ACPI')` does return (the duplicated-signature limitation) |
| `compare_acpi.py` | pairs the Windows tables with the Linux `acpidump` and checks sha256 — produces `../acpi/compare-linux-windows.txt` |
| `ec_state.py` | reads the EC registers through the `LpcACPIEC` module |
| `hold_state.py` | holds an EPP/fan state while a load runs |
| `ec_pawnio.py` | thin PawnIO wrapper (port I/O read/write, MSR read/write) |
| `msr_read.py` | reads `MSR 0x610` (RAPL PL1/PL2) through the `IntelMSR` module |
| `win_matrix.py` | the 2×2 EPP × fan matrix runner (start/stop, labels, 1 Hz logging) |
| `WinLoad.cs` | the load generator: 8 threads of an xorshift64 integer loop, 60 s |

## Pre-built binaries

`IntelMSR.bin` and `LpcACPIEC.bin` are **third-party PawnIO modules** (the
PawnIO 2.2.0 install present on the unit, per `../environment.txt`), used
because the EC port I/O and MSR access needed for this comparison are not
available to user mode otherwise. They are kept here only so the exact bytes
behind the numbers stay checkable:

```
d6ed85d65ab17a22f813ef98207d6d537155ee2ded5976a21cb48413c9b92e5f  IntelMSR.bin
c38fd116e7aff4d1fdb0a494e296be0a6708e5a22fc72f14587442fb7f8f7906  LpcACPIEC.bin
```

They come from the PawnIO project, not from this repository — see upstream for
its licence and for the current version. If you would rather not carry
third-party binaries, install PawnIO yourself and delete these two files; the
scripts only need the modules to be registered.

The hashes above are the only claim made here: these are the bytes that produced
the published measurements.
