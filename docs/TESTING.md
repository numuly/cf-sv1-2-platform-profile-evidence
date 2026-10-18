# Testing this on your own Let's Note

Owners of other Panasonic Let's Note models are the most useful thing this
series can get: a second `Tested-by:` from a different machine carries more
weight than any amount of data from one unit.

There are two levels. Do the first one if you only have a few minutes.

## Level 1 — the firmware path (no patched driver needed)

Shows whether your EC exposes the same two toggles the RFC maps.

```sh
# prerequisites: acpi_call loaded, root shell, on AC power
modprobe acpi_call

EC='\_SB_.PC00.LPCB.EC0_'          # your EC path may differ; check your DSDT
cat /proc/acpi/call >/dev/null     # sanity

# read the two policy booleans
echo "\$EC.CEFM" > /proc/acpi/call; cat /proc/acpi/call    # fan: 0 active, 1 passive
echo "\$EC.EPLE" > /proc/acpi/call; cat /proc/acpi/call    # TDP: 1 locked, 0 unlocked

# try flipping them (write back the original value afterwards!)
echo "\$EC.SEFM 0" > /proc/acpi/call
echo "\$EC.SEPL 1" > /proc/acpi/call
# re-read CEFM/EPLE and confirm they followed
```

Also useful:

```sh
cat /sys/class/dmi/id/sys_vendor /sys/class/dmi/id/product_name
sudo acpidump -b -o acpi.dat        # for the SSDT containing SEFM/SEPL
```

Send us: DMI vendor/product name, BIOS version, `CEFM`/`EPLE` before and after,
and whether the values stuck. That alone tells us whether your model belongs to
the same table.

## Level 2 — the actual driver (what a `Tested-by:` needs)

Do this once upstream **v4** is posted.

1. Get the series from the thread on lore
   (<https://lore.kernel.org/all/20261007190446.38862-1-alexyeo362@gmail.com/>);
   take v4 when it lands instead of v3.
2. Apply it to `drivers/platform/x86/panasonic-laptop.c`, then build
   out-of-tree — the exact recipe and its gotchas are in
   `driver/README.md` (the `.c` must sit next to the `Makefile`).
3. `rmmod panasonic_laptop && insmod build/panasonic-laptop.ko`
4. Check what your model exposes:
   ```sh
   cat /sys/firmware/acpi/platform_profile_choices
   cat /sys/firmware/acpi/platform_profile
   ```
5. Round-trip every choice and cross-check the EC state:
   ```sh
   for p in $(cat /sys/firmware/acpi/platform_profile_choices); do
       echo "$p" > /sys/firmware/acpi/platform_profile
       sync; sleep 1
       printf '%s -> %s\n' "$p" "$(cat /sys/firmware/acpi/platform_profile)"
       # optional: cross-check CEFM/EPLE as in level 1
   done
   ```
6. Check the unmapped combination reports `custom`:
   ```sh
   echo '\_SB_.PC00.LPCB.EC0_.SEFM 1' > /proc/acpi/call   # passive
   echo '\_SB_.PC00.LPCB.EC0_.SEPL 0' > /proc/acpi/call   # unlocked
   cat /sys/firmware/acpi/platform_profile                # expect: custom
   ```
7. `dmesg | tail` — expect no errors on load or on profile changes.
8. Suspend/resume once (`sudo rtcwake -m mem -s 30`), then re-read
   `/sys/firmware/acpi/platform_profile`.
9. Power-cycle back to your normal state.

## Reporting back

Reply **in the thread on lore** (never start a new root), keep the `Cc` list,
and include:

```
Tested-by: Your Name <you@example.com>
```

with a couple of lines above it saying what you ran: model, BIOS, kernel,
whether the round-trip and the `custom` case worked, and anything unexpected.
If you cannot reply on the list, open an issue in the public repository and we
will relay it:

<https://github.com/numuly/cf-sv1-2-platform-profile-evidence/issues>

## Safety notes

- Only the two documented EC methods are written. Do not poke other EC
  registers; that is how laptops get bricked.
- Write back the state you found, and do not run a userspace fan governor
  (`sv`, `panafanpwr`, …) at the same time — while `TFN1._FSL` is set the EC
  masks profile changes, and the results become meaningless.
- Run this on AC power. On battery, the platform's own battery policy hides the
  TDP toggle (measured on CF-SV1-2: ~5 W regardless of EPP).
