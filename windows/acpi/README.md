# windows/acpi — the ACPI side of the Windows session

| path | contents |
|---|---|
| `registry/` | the kernel's own copy of every firmware table (`HKLM\HARDWARE\ACPI`) — the only user-mode source that yields all 12 SSDTs, plus `index.csv` (sizes, sha256) and the registry dump text |
| `firmware-api/tables.csv` | what `GetSystemFirmwareTable('ACPI')` does return, i.e. the enumeration with duplicated SSDT IDs |
| `compare-linux-windows.txt` | the table-by-table comparison against `../../linux/acpi/acpi-tables-20261016.tar.gz` |

Result: all 15 firmware tables are byte-identical between the Linux dump
(V2.00L23) and this Windows dump (V2.00L24), so the BIOS update changed nothing.
