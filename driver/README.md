# Test report — patched driver built and loaded on CF-SV1-2

Date: 2026-10-26. Build + load + round-trip test of **RFC v4** of Alex Yeo's
`panasonic-laptop` platform_profile series with the CF-SV1-2 DMI entry
(`cf-sv1-platform_profile-quirk.patch`) applied on top. This supersedes the
v3 test in `archive/v3-20261016.md`.

The entry was requested by Alex on 2026-10-26: the SV1 uses the same
`CEFM`/`EPLE` boolean mapping as the CF-SR4, so it reuses `quirk_cf_sr4`
(`cool` = active + locked, `quiet` = passive + locked, `performance` =
active + unlocked) and only adds a DMI entry. The fourth combination
(passive + unlocked) is `custom`.

## Environment

```
machine   Panasonic CF-SV1-2 (DMI CFSV1-2), i5-1145G7
BIOS      V2.00L24 (2026-08-27)
kernel    7.2.9+deb13-amd64 (Debian 13), gcc 14.2.0
headers   linux-headers-7.2.9+deb13-amd64
config    CONFIG_PANASONIC_LAPTOP=m, CONFIG_ACPI_PLATFORM_PROFILE=y,
          Secure Boot off
tools     acpi-call 1.2.2 (dkms) for the CEFM/EPLE cross-checks
state     AC power, no thermald, no userspace governor, TFN1._FSL = 0
suspend   s2idle only (/sys/power/mem_sleep = [s2idle]; no deep S3)
```

## Base compatibility

RFC v4 patches `drivers/platform/x86/panasonic-laptop.c` from pre-image blob
`19d194ff37ca..` to post-image `e929d2527fb9..`. The Linux v7.3 file hashes to

```
19d194ff37ca9333157b66c45228669d7c1ede94
```

i.e. it is the exact pre-image. The v4 text used here was taken from the
archived message (`msg67802` on spinics, Message-ID
`20261025191300.1259541-1-alexyeo362@gmail.com`) and both blob hashes match,
so the applied code is byte-identical to the posted v4.

With the 8-line CF-SV1-2 entry the post-image is

```
69d255a0c3b07241290359bcdc7e0caf92c9804c
```

The entry applies to a clean v4 tree with `git apply --check` and no fuzz.
lore's HTTP side is behind Anubis and the local NNTP client needs Python ≤ 3.12,
so the archive copy linked above is the check used for the v4 text.

## Recipe

```sh
# 1. base: Linux v7.3 drivers/platform/x86/panasonic-laptop.c
mkdir -p build/drivers/platform/x86
cp .../panasonic-laptop.c build/drivers/platform/x86/
( cd build && patch -p1 < v4-panasonic-laptop.diff )
( cd build && patch -p1 < ../driver/cf-sv1-platform_profile-quirk.patch )

# 2. out-of-tree build: the .c MUST sit next to the Makefile at the module root
cp build/drivers/platform/x86/panasonic-laptop.c build/
printf 'obj-m += panasonic-laptop.o\n' > build/Makefile
make -C /lib/modules/$(uname -r)/build M=$PWD/build modules

# 3. swap it in (reversible: rmmod + modprobe restores the stock module)
rmmod panasonic_laptop
insmod build/panasonic-laptop.ko
```

Gotchas are unchanged from the v3 report: the `.c` must be at the module root,
and `pahole`/compiler-version warnings from kbuild are harmless.

## Results

```
$ cat /sys/firmware/acpi/platform_profile_choices
cool quiet performance
$ cat /sys/class/platform-profile/platform-profile-0/choices
cool quiet performance
```

`get()`/`set()` round-trip, cross-checked against the EC methods directly
(`CEFM` fan, `EPLE` TDP; read via `acpi_call`). Both the legacy
`/sys/firmware/acpi/…` frontend and the class device
`/sys/class/platform-profile/platform-profile-0/…` were read; both write
paths were exercised.

| set target | legacy | class | `CEFM` | `EPLE` |
|---|---|---|---|---|
| `cool` | cool | cool | 0x0 (active) | 0x1 (locked) |
| `quiet` | quiet | quiet | 0x1 (passive) | 0x1 (locked) |
| `performance` | performance | performance | 0x0 (active) | 0x0 (unlocked) |
| write `quiet` via class | quiet | quiet | 0x1 | 0x1 |

Unmapped combination — `SEFM 1` + `SEPL 0` (passive + unlocked) written
straight to the EC:

```
CEFM=0x1 EPLE=0x0  ->  platform_profile = custom
```

The ABI itself refuses `custom` (`EINVAL`) and `max-power` (`EOPNOTSUPP`), so
the only way to reach that state is a direct EC write, as expected.

Suspend/resume (s2idle; the machine has no deep S3):

| state before | cycle | after resume | `CEFM`/`EPLE` after | write after resume |
|---|---|---|---|---|
| `quiet` | s2idle, cut short by a wakeup event (~8 s) | quiet | 0x1 / 0x1 | performance works |
| `cool` | s2idle, 15 s RTC wake | cool | 0x0 / 0x1 | — |

So `get()` after resume is the firmware state, unchanged by the cycle, and a
profile write after resume still reaches the EC. `dmesg` has no errors on
module load or on profile changes; only the expected input-device line.

## Evidence files

- `logs-20261026/roundtrip.log` — choices + set/get + CEFM/EPLE table
- `logs-20261026/custom.log` — passive+unlocked → `custom`, then ABI restore
- `logs-20261026/abi-reject.log` — `custom` / `max-power` rejected
- `logs-20261026/postresume-15s.log`, `postresume-early-wake.log`
- `logs-20261026/verification.txt` — blob hashes, patch apply, build
- `logs-20261026/environment.txt`, `dmesg-filtered.txt`

## Caveats

- The series is based on Linux v7.3; this test runs the v7.3 driver source
  on Debian's 7.2.9 kernel (out-of-tree module). The driver code is v4
  verbatim; only the host kernel differs.
- Only s2idle is available on this unit, so "post-resume" above means s2idle,
  not S3.
- v4 is still an RFC. If a v5 changes the DMI table or the quirk shape, this
  8-line entry needs a respin.
- v4's cover letter still says `COOL (SR4 only)` and "for every model except
  the SR4, only balanced and performance are defined"; with SV1 added both
  statements are stale. The code is unaffected; the cover should be updated
  in v5.
- The historical v3 build/load result (2026-10-16) is in
  `archive/v3-20261016.md`; it used the earlier duplicate-struct revision.
