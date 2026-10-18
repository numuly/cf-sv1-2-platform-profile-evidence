# Test report — patched driver built and loaded on CF-SV1-2

Date: 2026-10-16. This is a *build + load + read-back* test of the RFC v3
patch with our CF-SV1-2 quirk applied, on a fresh Ubuntu install — not yet a
full measurement campaign.

## Environment

```
machine   Panasonic CF-SV1-2 (DMI CFSV1-2), i5-1145G7, BIOS V2.00L23
kernel    7.3.0-9-generic (Ubuntu 26.10), gcc 15.3.0
headers   linux-headers-7.3.0-9-generic ; source linux-source-7.3.0
config    CONFIG_PANASONIC_LAPTOP=m, CONFIG_ACPI_PLATFORM_PROFILE=y, Secure Boot off
```

## Base compatibility

RFC v3 patches `drivers/platform/x86/panasonic-laptop.c` with pre-image blob
`19d194ff37ca`. The file in `linux-source-7.3.0` hashes to

```
19d194ff37ca9333157b66c45228669d7c1ede94
```

i.e. identical — v3 applies cleanly, and our quirk (post-image `c4b13a3`)
applies on top with no fuzz.

> Note (2026-10-18): the quirk has since been restructured per Ilpo's review to
> reuse `quirk_cf_sr4` and only add a DMI entry (same boolean mapping), so the
> current `driver/` no longer has the `c4b13a3` post-image. The build/load test
> below was run with the earlier revision; the mapping and the driver-side
> behaviour are unchanged.

## Recipe

```sh
# 1. source
apt-get install -y linux-source-7.3.0
tar -xjf /usr/src/linux-source-7.3.0.tar.bz2 -C /tmp/kern \
    --wildcards '*/drivers/platform/x86/panasonic-laptop.c'

# 2. apply RFC v3 (extract the .c hunk from the v3 message) then our quirk
mkdir -p build/drivers/platform/x86
cp /tmp/kern/linux-source-7.3.0/drivers/platform/x86/panasonic-laptop.c \
   build/drivers/platform/x86/
( cd build && patch -p1 < v3-panasonic-laptop.diff )
( cd build && patch -p1 < ../driver/cf-sv1-platform_profile-quirk.patch )

# 3. out-of-tree build: the .c MUST sit next to the Makefile at the module root
cp build/drivers/platform/x86/panasonic-laptop.c build/
printf 'obj-m += panasonic-laptop.o\n' > build/Makefile
make -C /lib/modules/$(uname -r)/build M=$PWD/build modules

# 4. swap it in
rmmod panasonic_laptop
insmod build/panasonic-laptop.ko
```

Gotchas:

- Put the `.c` at the module root, next to the `Makefile` — leaving it in
  `drivers/platform/x86/` makes kbuild fail with
  `No rule to make target 'panasonic-laptop.o'`.
- `pahole`/compiler-version warnings from kbuild are harmless here.
- `platform_profile_register`/`…_remove`/`devm_platform_profile_register` are
  `EXPORT_SYMBOL_GPL` in this kernel, so a module can use them.

## Results

Module: `vermagic 7.3.0-9-generic SMP preempt mod_unload modversions`,
`srcversion 98A69AA2E1988FF2D077B4A`.

```
$ cat /sys/firmware/acpi/platform_profile_choices
cool quiet performance
```

`get()`/`set()` round-trip, cross-checked against the EC methods directly
(`CEFM` fan, `EPLE` TDP; read via `acpi_call`):

| set target | `platform_profile` | `CEFM` | `EPLE` |
|---|---|---|---|
| `quiet` | quiet | 0x1 (passive) | 0x1 (locked) |
| `cool` | cool | 0x0 (active) | 0x1 (locked) |
| `performance` | performance | 0x0 (active) | 0x0 (unlocked) |

Edge case — an unmapped combination (`SEFM 1` + `SEPL 0`, i.e.
passive + unlocked, written straight to the EC) is reported as:

```
CEFM=0x1 EPLE=0x0  ->  platform_profile = custom
```

which matches the RFC's "CUSTOM is returned when the current state is not
recognised". No errors in `dmesg` on load or profile changes.

## Not yet done

- rebuild + reload the restructured quirk.  The build/load/round-trip
  result above is from the earlier `c4b13a3` revision.  The *current* patch
  (`.driver_data = &quirk_cf_sr4` + DMI entry, per Ilpo's review) has only had
  its hunk checked for apply — it has not been compiled, loaded, or had the
  `cool`/`quiet`/`performance` <-> `CEFM`/`EPLE` round-trip and the unmapped ->
  `custom` case re-run on hardware.  Redo this on RFC v4.
- the quirk rebased onto RFC v4;
- the consolidated in-thread reply carrying the `Tested-by:`.

(The corrected AC matrix, thermald A/B, Windows comparison and wall-meter
input power are all done — see `../linux/`.)
