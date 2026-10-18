#!/usr/bin/env python3
"""Windows CF-SV1-2 2x2 comparison matrix.

Levers available on Windows (the EC SEPL/SEFM ACPI methods are reachable only
through the firmware SMI path, so from user mode we use what Windows exposes):

  power : EPP 0   (performance)  vs  EPP 100 (efficiency)
          base scheme value, overlays disabled
  fan   : Panasonic FanControl.Mode "cool" vs "quiet"  (EC fan policy)

Per state: 30 s settle -> WinLoad.exe (8 threads, 60 s load, 1 Hz LHM sample)
-> 45 s cooldown. 3 interleaved rounds.  EC registers and MSR 0x610 are
recorded per run.
"""
import argparse
import datetime
import os
import statistics
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import ec_pawnio as ec  # noqa: E402
import ec_state as es  # noqa: E402
import msr_read  # noqa: E402

PPCHUB = r"C:\Program Files\Panasonic\PPcHub\PPcHub.CLI.exe"
WINLOAD = os.path.join(HERE, "WinLoad.exe")
SUB = "54533251-82be-4824-96c1-47b60b740d00"
EPP = "36687f9e-e3a5-4dbf-b1dc-15eb381c6863"
BALANCED_OVERLAY = "00000000-0000-0000-0000-000000000000"

STATES = [
    ("perf-cool", 0, "cool"),
    ("perf-quiet", 0, "quiet"),
    ("eff-cool", 100, "cool"),
    ("eff-quiet", 100, "quiet"),
]


def sh(cmd):
    r = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return r.stdout.strip(), r.stderr.strip(), r.returncode


def set_epp(v):
    sh('powercfg /overlaysetactive %s' % BALANCED_OVERLAY)
    for idx in ("ac", "dc"):
        sh('powercfg /set%svalueindex SCHEME_CURRENT %s bc5038f7-23e0-4960-96da-33abaf5935ec 100' % (idx, SUB))
        sh('powercfg /set%svalueindex SCHEME_CURRENT %s be337238-0d82-4146-a960-4f3749d470c7 2' % (idx, SUB))
        sh('powercfg /set%svalueindex SCHEME_CURRENT %s %s %d' % (idx, SUB, EPP, v))
    sh('powercfg /setactive SCHEME_CURRENT')


def _epp_reg(suffix):
    key = (r"HKLM:\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes"
           r"\381b4222-f694-41f0-9685-ff5bb260df2e\%s\%s" % (SUB, EPP))
    out, _, _ = sh('powershell -NoProfile -Command "(Get-ItemProperty \'%s\').%s"' % (key, suffix))
    return out.strip()


def get_epp():
    return _epp_reg("ACSettingIndex")


def get_epp_dc():
    return _epp_reg("DCSettingIndex")


def set_fan(mode):
    sh('"%s" set fancontrol mode %s' % (PPCHUB, mode))


def get_fan():
    out, _, _ = sh('"%s" get fancontrol mode' % PPCHUB)
    return out.split(":")[-1].strip()


def read_ec_regs():
    try:
        return dict(fan79=ec.ec_read(0x79), pl_ca=ec.ec_read(0xCA),
                    pl_cb=ec.ec_read(0xCB), ee=ec.ec_read(0xEE))
    except OSError as e:
        return {"error": str(e)}


def read_msr_pl():
    try:
        h = msr_read.wt.HANDLE()
        msr_read.pawnio.pawnio_open(msr_read.ctypes.byref(h))
        blob = open(os.path.join(HERE, "IntelMSR.bin"), "rb").read()
        msr_read.pawnio.pawnio_load(h, blob, len(blob))
        try:
            v = msr_read.read_msr(h, 0x610)
        finally:
            msr_read.pawnio.pawnio_close(h)
        return (v & 0x7FFF) / 8.0, ((v >> 32) & 0x7FFF) / 8.0
    except Exception as e:
        return ("error", str(e))


def battery():
    out, _, _ = sh('powershell -NoProfile -Command "(Get-CimInstance Win32_Battery).BatteryStatus"')
    return out.strip()


def run_state(outdir, rnd, name, epp, fan, load_s, idle_s, settle_s, cooldown_s):
    set_epp(epp)
    set_fan(fan)
    time.sleep(settle_s)

    base = "%s_r%d_%s" % (name, rnd, name)
    csv = os.path.join(outdir, "r%d_%s.csv" % (rnd, name))
    meta = os.path.join(outdir, "r%d_%s.meta" % (rnd, name))
    if os.path.exists(meta):
        print("  skip (meta exists): %s" % meta, flush=True)
        return csv

    ec.open_pawnio()
    ec.lock()
    try:
        regs_pre = read_ec_regs()
    finally:
        ec.unlock()
        ec.pawnio.pawnio_close(ec._handle)

    pl1, pl2 = read_msr_pl()
    t0 = datetime.datetime.now().astimezone().isoformat()
    subprocess.run([WINLOAD, csv, str(load_s), str(idle_s), name], check=True)
    t1 = datetime.datetime.now().astimezone().isoformat()

    ec.open_pawnio()
    ec.lock()
    try:
        regs_post = read_ec_regs()
    finally:
        ec.unlock()
        ec.pawnio.pawnio_close(ec._handle)

    with open(meta, "w") as f:
        f.write("state=%s epp=%s fan=%s\n" % (name, epp, fan))
        f.write("start=%s end=%s\n" % (t0, t1))
        f.write("epp_registry=%s epp_registry_dc=%s fan_cli=%s battery_status=%s\n"
                % (get_epp(), get_epp_dc(), get_fan(), battery()))
        f.write("msr610_pl1_w=%s msr610_pl2_w=%s\n" % (pl1, pl2))
        f.write("ec_pre=%s\nec_post=%s\n" % (regs_pre, regs_post))

    time.sleep(cooldown_s)
    return csv


def summarize(outdir, load_s):
    rows = {}
    for fn in sorted(os.listdir(outdir)):
        if not fn.endswith(".csv") or not fn.startswith("r") or "_" not in fn:
            continue
        parts = fn[:-4].split("_", 1)
        if len(parts) != 2 or not parts[0][1:].isdigit():
            continue
        state = parts[1]
        pw, tp = [], []
        with open(os.path.join(outdir, fn)) as f:
            hdr = f.readline().strip().split(",")
            ip = hdr.index("power_pkg_w")
            it = hdr.index("temp_pkg_c")
            iph = hdr.index("phase")
            for line in f:
                c = line.strip().split(",")
                if len(c) <= max(ip, it, iph) or c[iph] != "load":
                    continue
                try:
                    pw.append(float(c[ip]))
                    tp.append(float(c[it]))
                except ValueError:
                    pass
        if pw:
            rows.setdefault(state, []).extend(zip(pw, tp))
    with open(os.path.join(outdir, "summary.csv"), "w") as f:
        f.write("state,n,pkg_w_median,pkg_w_min,pkg_w_max,temp_c_max\n")
        for state in sorted(rows):
            pw = [x[0] for x in rows[state]]
            tp = [x[1] for x in rows[state]]
            f.write("%s,%d,%.2f,%.2f,%.2f,%.0f\n" % (
                state, len(pw), statistics.median(pw), min(pw), max(pw), max(tp)))
            print("%-12s n=%2d pkg=%.2f W (%.2f-%.2f)  maxT=%.0f C" % (
                state, len(pw), statistics.median(pw), min(pw), max(pw), max(tp)))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=os.path.join(HERE, "runs"))
    ap.add_argument("--load", type=int, default=60)
    ap.add_argument("--idle", type=int, default=5)
    ap.add_argument("--settle", type=int, default=30)
    ap.add_argument("--cooldown", type=int, default=45)
    ap.add_argument("--rounds", type=int, default=3)
    ap.add_argument("--only", default=None)
    args = ap.parse_args()
    os.makedirs(args.out, exist_ok=True)

    states = STATES if not args.only else [s for s in STATES if s[0] == args.only]
    for rnd in range(1, args.rounds + 1):
        order = states[rnd % len(states):] + states[:rnd % len(states)]
        for name, epp, fan in order:
            print("[round %d] %s epp=%d fan=%s" % (rnd, name, epp, fan), flush=True)
            try:
                run_state(args.out, rnd, name, epp, fan, args.load, args.idle,
                          args.settle, args.cooldown)
            except Exception as e:
                print("  ERROR in %s r%d: %s" % (name, rnd, e), flush=True)
    try:
        summarize(args.out, args.load)
    except Exception as e:
        print("summarize failed: %s" % e, flush=True)


if __name__ == "__main__":
    main()
