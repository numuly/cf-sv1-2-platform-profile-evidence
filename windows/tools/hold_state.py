#!/usr/bin/env python3
"""Hold one matrix state under load for a wall-meter reading.

Usage: hold_state.py <state> <seconds> [outdir]
States: perf-cool perf-quiet eff-cool eff-quiet idle
"""
import os
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import win_matrix as wm  # noqa: E402

STATE_MAP = {name: (epp, fan) for name, epp, fan in wm.STATES}


def main():
    state = sys.argv[1]
    seconds = int(sys.argv[2]) if len(sys.argv) > 2 else 600
    outdir = sys.argv[3] if len(sys.argv) > 3 else os.path.join(HERE, "runs", "meter")
    os.makedirs(outdir, exist_ok=True)

    if state == "idle":
        wm.set_epp(0)
        wm.set_fan("cool")
        time.sleep(5)
        print("idle state set; hold for %d s" % seconds, flush=True)
        time.sleep(seconds)
        return

    epp, fan = STATE_MAP[state]
    wm.set_epp(epp)
    wm.set_fan(fan)
    time.sleep(30)
    csv = os.path.join(outdir, "meter_%s.csv" % state)
    print("state %s epp=%d fan=%s -> %s" % (state, epp, fan, csv), flush=True)
    subprocess.run([wm.WINLOAD, csv, str(seconds), "3", state], check=True)


if __name__ == "__main__":
    main()
