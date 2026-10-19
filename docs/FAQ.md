# FAQ — the three questions this series raises

Short answers, each with the evidence behind it.

## 1. Why `platform_profile` and not hwmon or thermal?

Because on this hardware the two toggles are **firmware policy knobs, not fan
control**:

* the fan toggle (`SEFM`) chooses whether the EC runs its *active* or *passive*
  cooling policy — a policy, not a speed you can set in RPM;
* the TDP toggle (`SEPL`) picks one of the firmware's own power-limit tables
  (`IETM`), and writing a PL directly does not stick because the EC re-derives
  it (`REFM`/`REPL`);
* the exposed combinations line up with the `platform_profile` ABI's
  `cool` / `quiet` / `performance`, and unmapped combinations correctly report
  `custom`.

`hwmon` would have to invent a control that does not exist (there is no
settable fan speed), and `thermal` governs temperature reactively, whereas here
we are choosing between firmware policies. This is the same shape as the vendor
mappings already merged for several other laptops.

Evidence: `linux/ac-4state/` (the toggles are a power
lever and a temperature lever), `linux/acpi/ssdt2.dsl` (the `IETM`/`REFM`/
`REPL` path), `docs/METHOD.md`.

## 2. Does this fight `thermald` / DPTF?

No, and it was measured rather than argued. `thermald`'s first run since boot
performs the `_OSC` handshake and unlocks the TDP once; after that it does
not touch the profile again (a `cool` write stayed put for the whole 60 s
observation window). The driver's `get()` re-reads the firmware every time, so
even if something changes the state behind its back, the reported profile
follows instead of going stale.

Evidence — boot A/B capture, interaction capture, and the boot-transient caveat:
`linux/thermald/`.

## 3. Why does CF-SR4 get `cool` while the other models only get
`balanced`/`quiet`/`performance`?

This is the one open question in the thread and it is a **policy choice, not a
technical limit**:

* CF-SR4 boots into aggressive fan + locked TDP; calling that `cool` is the
  honest description, and `balanced` would be a worse name for the same state;
* CF-SV1-2 shows the *same* boolean mapping (`SEFM`/`SEPL`) as CF-SR4, so the
  published patch reuses the SR4 struct and exposes `cool`; dropping `cool` (so
  the model shows only `balanced`/`quiet`/`performance`) is a one-line change if
  the maintainer prefers to keep that name SR4-only;
* the measurements do not depend on the choice — `cool` and `balanced` are the
  same EC state.

Evidence: `driver/cf-sv1-platform_profile-quirk.patch`, the round-3 reply in
the [thread](https://lore.kernel.org/all/tencent_36C6A22A8A475F824CB6BAC101A1F272E709@qq.com/),
and the corrected AC matrix where
`active-locked` is the state in question.

## Also asked, shorter answers

* Does the model-generic quirk hide real differences? The hardware
  differences are documented in the quirk commit message instead of being
  encoded as separate structs, per Ilpo's review advice (reuse identical
  structs, keep the model notes in the message).
* Can this be tested without the driver? Yes for the firmware path: the EC
  booleans can be written with `acpi_call` — that is how the measurement campaign
  was done before v4 existed. See `docs/TESTING.md`.
