Windows battery-side (DC) attempt — negative result, kept for the record
=======================================================================

Goal: repeat the 2x2 matrix (EPP 0/100 x fan cool/quiet) on battery, to mirror
the Linux battery-4state session.  It did not produce a clean matrix, and the
reason is the result.

- Windows' *DC* processor settings (PROCTHROTTLEMAX, PERFBOOSTMODE) are unset in
  the Balanced scheme, so Windows throttles on battery.  The first attempt
  (`matrix_dc2` here is the rerun with the DC values pinned in win_matrix.py;
  the very first attempt showed ~5 W for every EPP state) was dominated by that.
- Even pinned, the platform pulls sustained package power back to ~5 W within
  about a minute; short bursts reach ~15 W at EPP=0.  Stopping the Intel
  Dynamic Tuning service (esifsvc, DPTF) did not remove the cap (~6.9 W), and a
  120 s run stayed ~6.9 W then rose to ~15 W.  The behaviour is the platform
  battery power management (EC + Intel DPTF), not EPP, and not reproducible
  enough for a state matrix.
- root\wmi BatteryStatus.DischargeRate is sticky (the same value for minutes),
  so it is not usable as per-state input power (battery_log.csv).
- EC register read-back also races with the ACPI EC driver on battery, so the
  .meta EC values are not trustworthy.

Files
  matrix/        the pinned-DC rerun (3 rounds x 4 states, 1 Hz + .meta)
  probes/        single-state probes (dc_probe, dc_probe100, dc_settle_test,
                 dc_nodptf_0, dc_decay_0, dc_reapply)
  battery_log.csv  root\wmi BatteryStatus discharge samples (sticky)
  matrix_dc2.log   the run log

The AC matrix in the parent directory is the comparison to use.  The DC-setting
gotcha is handled in tools/win_matrix.py for anyone repeating this.
