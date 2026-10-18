# linux/acpi — the firmware evidence

| file | contents |
|---|---|
| `ssdt2.dat`, `ssdt2.dsl` | the Panasonic `DptfTabl` SSDT, raw and decompiled — the `SEFM`/`SEPL`/`IETM` AML the replies quote |
| `acpidump-20261016.txt` | the full table dump from this unit (the MSDM body was removed on purpose) |
| `acpi-tables-20261016.tar.gz` | the same tables as files, for byte-exact comparison with the Windows dump |
| `dmidecode-20261016.txt` | DMI decode, with machine serials/UUID redacted |
| `firmware-baseline-20261016.txt` | the captured firmware baseline |

Reproducibility anchor: `ssdt2.dat` sha256 `f0d92acf…` — the value quoted in the
replies and matched by `../../windows/acpi/compare-linux-windows.txt`.
