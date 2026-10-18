# thermald A/B — CF-SV1-2, 2026-10-16

Alex's question in the thread: does `thermald` touch the fan/TDP setting, and
does its first run since boot unlock the TDP? These two captures answer it.

The `.log` files are the raw captures and keep their original text (a few
comment lines are in Chinese). This file is the English annotation of what they
contain.

## `thermald-ab.log` — boot capture

`thermald` is disabled at boot, then the EC state is read once before it is
started and once after:

```
PRE   thermald inactive: CEFM=0x0 EPLE=0x1   -> fan active, TDP locked   (= cool)
POST  thermald active:   CEFM=0x0 EPLE=0x0   -> fan active, TDP unlocked (= performance)
```

So `thermald`'s **first run since boot flips `EPLE` 1 -> 0** — the one-shot
`_OSC` handshake Alex described. Verified on this unit.

Caveat: the `idle_pkg_W` lines in the same capture are **boot-transient** (the
`PRE` sample lands ~3 s after boot while services are still starting). They must
not be read as a thermald power effect; the EC register transition is the result.

## `thermald-interaction.log` — is it continuous governance?

With `thermald` running, the profile is set to `cool` (`SEPL 1`, so `EPLE`
should read `0x1`) and sampled for 60 s:

```
t   profile CEFM EPLE
0..60  cool  0x0 0x1     (unchanged the whole minute)
```

The setting stays put for a full minute, so `thermald` does **not** keep
overriding the profile after that first `_OSC` unlock. The effect is one-shot,
not continuous governance — which is what makes a `platform_profile` control
usable next to it at all.

## Re-running it

`thermald` disabled at boot (`systemctl mask`/`stop`), then read the EC state,
start `thermald`, read it again. On Linux the EC reads/writes go through
`acpi_call` — the harness `../../tools/ac-matrix.py` does exactly that, and its
header documents the EC path (`\_SB_.PC00.LPCB.EC0_`). The `ec_state.py` /
`hold_state.py` helpers under `../../windows/tools/` are the Windows (PawnIO)
equivalents, not used for this capture.
