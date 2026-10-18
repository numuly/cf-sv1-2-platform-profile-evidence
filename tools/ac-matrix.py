#!/usr/bin/env python3
"""CF-SV1-2 AC 4-state platform_profile matrix (corrected, EPP=performance).

Why: the AC table in our round-1 LKML reply was taken with EPP=power and a
thermal tool re-applying it, so its *power* columns are an artifact. This
harness re-runs the AC matrix with EPP=performance, turbo enabled and no
userspace governor running, which is what round 2 promised.

States = (SEFM, SEPL) written straight to the EC via acpi_call:
    active-locked     SEFM=0 SEPL=1   (== platform_profile "cool")
    quiet-locked      SEFM=1 SEPL=1   (== "quiet")
    active-unlimited  SEFM=0 SEPL=0   (== "performance")
    quiet-unlimited   SEFM=1 SEPL=0   (== "custom", not settable via the ABI)

Per state: 30 s settle -> sysbench cpu --threads=8 --time=60 with 1 Hz RAPL
package + thermal sampling -> cooldown. CEFM/EPLE are read back after every
write; MSR 0x610 (RAPL PL1/PL2) is sampled per run.

Outputs (per run): <out>/<round>_<state>.csv  (epoch, energy_uj, pkg, cpu, sen1)
                    .csv.windows   (start end epoch of the load window)
                    .csv.meta      (pre/post ctx + sysbench score + PL1/PL2)
and <out>/summary.csv + <out>/run.log.

Run as root, on AC, with no `sv` governor and no `sv-epp.timer`.
"""
import argparse, os, re, struct, subprocess, sys, threading, time, statistics, pathlib, datetime

EC = r"\_SB_.PC00.LPCB.EC0_"
RAPL = "/sys/class/powercap/intel-rapl:0/energy_uj"
MSR = "/dev/cpu/0/msr"
MSR_PKG_POWER_LIMIT = 0x610

STATES = [
    ("active-locked",    0, 1),
    ("quiet-locked",     1, 1),
    ("active-unlimited", 0, 0),
    ("quiet-unlimited",  1, 0),
]

# thermal zone types we sample, in CSV column order after energy
TEMP_TYPES = ["x86_pkg_temp", "TCPU", "SEN1"]


def sh(cmd, **kw):
    return subprocess.run(cmd, shell=True, capture_output=True, text=True, **kw)


def acpi_call(expr):
    with open("/proc/acpi/call", "w") as f:
        f.write(expr)
    with open("/proc/acpi/call") as f:
        return f.read().strip().strip("\x00").strip()


def rd(method):
    return acpi_call(f"{EC}.{method}")


def wr(method, val):
    return acpi_call(f"{EC}.{method} {val}")


def temp_attr():
    """map thermal type -> value attribute (mdegC path)."""
    m = {}
    for d in pathlib.Path("/sys/class/thermal").glob("thermal_zone*"):
        try:
            t = (d / "type").read_text().strip()
            if t in TEMP_TYPES:
                m[t] = d / "temp"
        except OSError:
            pass
    return m


def read_temps():
    out = []
    for t in TEMP_TYPES:
        try:
            out.append(int(pathlib.Path(tz[t]).read_text().strip()))
        except Exception:
            out.append(0)
    return out


def read_rapl():
    try:
        return int(pathlib.Path(RAPL).read_text().strip())
    except Exception:
        return 0


def read_msr_pl():
    try:
        with open(MSR, "rb") as f:
            f.seek(MSR_PKG_POWER_LIMIT)
            v = struct.unpack("<Q", f.read(8))[0]
        pl1 = (v & 0x7FFF) / 8.0
        pl2 = ((v >> 32) & 0x7FFF) / 8.0
        return pl1, pl2
    except Exception as e:
        return None, None


def set_epp(pref):
    n = 0
    for p in pathlib.Path("/sys/devices/system/cpu/cpufreq").glob("policy*/energy_performance_preference"):
        try:
            p.write_text(pref)
            n += 1
        except OSError:
            pass
    return n


def set_no_turbo(v):
    pathlib.Path("/sys/devices/system/cpu/intel_pstate/no_turbo").write_text(str(v))


def ctx():
    ac = ""
    for p in pathlib.Path("/sys/class/power_supply").glob("AC*/online"):
        ac = p.read_text().strip()
    return (f"AC={ac} S0IX={rd('S0IX')} PWRS={rd('PWRS')} "
            f"CEFM={rd('CEFM')} EPLE={rd('EPLE')}")


def sysbench_score(text):
    m = re.search(r"events per second:\s*([0-9.]+)", text)
    if not m:
        m = re.search(r"total number of events:\s*([0-9.]+)", text)
    return float(m.group(1)) if m else float("nan")


def preflight():
    problems = []
    ac = ""
    for p in pathlib.Path("/sys/class/power_supply").glob("AC*/online"):
        ac = p.read_text().strip()
    if ac != "1":
        problems.append(f"AC online is {ac!r}, need AC power")
    for svc in ("sv.service", "sv-hw.service", "sv-epp.timer"):
        r = sh(f"systemctl is-active {svc}")
        if r.stdout.strip() == "active":
            problems.append(f"{svc} is active (would re-write EPP/PL)")
    if sh("pgrep -x sv-hw") .stdout.strip():
        problems.append("sv-hw process present")
    if not os.path.exists("/proc/acpi/call"):
        problems.append("/proc/acpi/call missing (modprobe acpi_call)")
    if not os.path.exists(MSR):
        problems.append(f"{MSR} missing (modprobe msr)")
    return problems


def sample_loop(stop, rows):
    while not stop.is_set():
        rows.append((int(time.time()), read_rapl(), read_temps()))
        stop.wait(1.0)


def wait_cooldown(limit_s=180, target=45_000):
    t0 = time.time()
    while time.time() - t0 < limit_s:
        pkg = read_temps()[0]
        if pkg and pkg <= target:
            # settle a bit more
            time.sleep(5)
            return
        time.sleep(5)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=f"ac-4state-{datetime.datetime.now():%Y%m%d}")
    ap.add_argument("--rounds", type=int, default=3)
    ap.add_argument("--load-secs", type=int, default=60)
    ap.add_argument("--settle-secs", type=int, default=30)
    ap.add_argument("--threads", type=int, default=8)
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    global tz
    tz = temp_attr()

    probs = preflight()
    print("preflight:", "OK" if not probs else "PROBLEMS:")
    for p in probs:
        print("  -", p)
    if probs:
        sys.exit("refusing to run")

    print("setting EPP=performance, no_turbo=0 ...")
    n = set_epp("performance")
    set_no_turbo(0)
    time.sleep(1)
    print(f"  EPP set on {n} policies; no_turbo={pathlib.Path('/sys/devices/system/cpu/intel_pstate/no_turbo').read_text().strip()}")

    if args.dry_run:
        for s, sf, sp in STATES:
            print(f"  would test {s}: SEFM={sf} SEPL={sp}")
        return

    out = pathlib.Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    log = open(out / "run.log", "a")
    def L(msg):
        line = f"{datetime.datetime.now().isoformat(timespec='seconds')} {msg}"
        print(line); log.write(line + "\n"); log.flush()

    L(f"START rounds={args.rounds} load={args.load_secs}s threads={args.threads} EPP=performance no_turbo=0")
    pl1, pl2 = read_msr_pl()
    L(f"MSR 0x610: PL1={pl1} W PL2={pl2} W")

    summary = []
    for rnd in range(1, args.rounds + 1):
        order = STATES if rnd % 2 else list(reversed(STATES))
        for name, sf, sp in order:
            pre = ctx()
            wr("SEFM", sf); wr("SEPL", sp)
            time.sleep(0.5)
            rb = ctx()
            pp = ""
            try:
                pp = pathlib.Path("/sys/firmware/acpi/platform_profile").read_text().strip()
            except Exception:
                pass
            L(f"r{rnd} {name}: set SEFM={sf} SEPL={sp} -> {rb} platform_profile={pp}")
            time.sleep(args.settle_secs)

            stop = threading.Event()
            rows = []
            th = threading.Thread(target=sample_loop, args=(stop, rows), daemon=True)
            th.start()
            win_start = int(time.time())
            res = sh(f"sysbench cpu --threads={args.threads} --time={args.load_secs} run")
            win_end = int(time.time())
            stop.set(); th.join(timeout=3)

            score = sysbench_score(res.stdout)
            post = ctx()
            pl1a, pl2a = read_msr_pl()

            # write per-run files
            csv = out / f"r{rnd}_{name}.csv"          # keep it name-based (clearer than indices)
            with open(csv, "w") as f:
                for ep, en, ts in rows:
                    f.write(f"{ep},{en},{ts[0]},{ts[1]},{ts[2]}\n")
            (out / f"r{rnd}_{name}.csv.windows").write_text(f"{win_start} {win_end}\n")
            (out / f"r{rnd}_{name}.csv.meta").write_text(
                f"ctx pre: {pre}\n    events per second:  {score:.2f}\n"
                f"    state: {name} SEFM={sf} SEPL={sp} platform_profile={pp}\n"
                f"    MSR 0x610: PL1={pl1a} PL2={pl2a}\n"
                f"ctx post: {post}\n")

            # window stats
            w = [(ep, en) for ep, en, ts in rows if win_start <= ep <= win_end]
            pkg = []
            if len(w) >= 2:
                dt = w[-1][0] - w[0][0]
                de = w[-1][1] - w[0][1]
                pkg_w = (de / 1e6) / dt if dt else float("nan")
            else:
                pkg_w = float("nan")
            temps = [t[0] for ep, en, t in rows if win_start <= ep <= win_end and t[0]]
            tmax = max(temps) if temps else 0
            summary.append((rnd, name, score, pkg_w, tmax))
            L(f"  -> score={score:.1f} e/s  pkg={pkg_w:.2f} W  pkg_max={tmax/1000:.1f} C  post={post}")

            wait_cooldown()

    # summary
    with open(out / "summary.csv", "w") as f:
        f.write("round,state,sysbench_e_per_s,pkg_w,pkg_max_mdegC\n")
        for row in summary:
            f.write(f"{row[0]},{row[1]},{row[2]:.2f},{row[3]:.4f},{row[4]}\n")
    L("DONE — summary.csv written")

    # per-state medians
    by = {}
    for rnd, name, s, p, t in summary:
        by.setdefault(name, []).append((s, p, t))
    L("per-state (median of rounds):")
    for name, vals in by.items():
        sc = statistics.median(v[0] for v in vals)
        pw = statistics.median(v[1] for v in vals)
        tm = max(v[2] for v in vals)
        L(f"  {name:16} e/s={sc:8.1f}  pkg={pw:5.2f} W  pkg_max={tm/1000:.1f} C")


if __name__ == "__main__":
    main()
