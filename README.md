CF-SV1-2 platform_profile evidence
==================================

Data behind my mails in the panasonic-laptop RFC thread:
https://lore.kernel.org/all/20261007190446.38862-1-alexyeo362@gmail.com/

linux/ac-4state/  corrected AC 4-state matrix (3 rounds, 1 Hz raw + summary)
linux/thermald/   thermald A/B boot capture
windows/load/     Windows 11 8-thread load, wall meter, pure-AC peak
windows/acpi/     full ACPI dump from the Windows side (12 SSDTs etc.)
tools/            the harness that produced the above

summary.csv in each directory has the numbers quoted in the mail; the r*.csv
are the raw 1 Hz samples.  Windows-side quirks are in windows/notes.md.
