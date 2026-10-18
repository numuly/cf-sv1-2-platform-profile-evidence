Windows-side notes
==================

- The effective EC path on Windows is EC88 -> ASRV -> SMI on port 0xB2
  (DSDT: OperationRegion SPRT, SystemIO 0xB2).  User mode cannot drive it, so
  the Linux SEFM x SEPL four-state matrix cannot be reproduced on Windows.

- On AC the OS power lever is EPP: EPP=0 gives ~23 W package / ~35 W wall and
  EPP=100 gives ~6 W / ~13 W.  MSR 0x610 stays 28/60 W and the readable EC PL
  registers (0xCA/0xCB) do not move.

- The Panasonic utility on this model exposes only fan control (cool/quiet),
  there is no performance mode; the fan mode is a temperature lever.

- Battery side: the platform battery policy (EC + Intel DPTF) pulls sustained
  package power back to ~5 W regardless of EPP, so there is no clean DC matrix.

- ACPI: GetSystemFirmwareTable returns only the first table of a duplicated
  signature, so the 12 SSDTs come from HKLM\HARDWARE\ACPI (windows/acpi/).
  All firmware tables are byte-identical to the Linux dump.
