#!/usr/bin/env python3
"""EC command layer for the CF-SV1-2 (matches DSDT EC87 / EC88).

EC88(0xB5, sub, value, arg3) is implemented in the DSDT as:
    ER05 = sub; ER06 = value; ER07 = arg3; ER04 = 0xB5; poll ER04 until 0/0xFF
so the same can be done from user mode through PawnIO.
"""
import sys
import time
import ec_pawnio as ec

CMD = 0xB5


def command(sub, value, arg3=0, timeout=2.0):
    ec.ec_write(0x05, sub & 0xFF)
    ec.ec_write(0x06, value & 0xFF)
    ec.ec_write(0x07, arg3 & 0xFF)
    ec.ec_write(0x04, CMD)
    t0 = time.time()
    while time.time() - t0 < timeout:
        st = ec.ec_read(0x04)
        if st == 0x00:
            return 0
        if st == 0xFF:
            return -1
        time.sleep(0.01)
    return -2


def read_state():
    return dict(
        fan=ec.ec_read(0x79),
        pl1=ec.ec_read(0xCA),
        pl2=ec.ec_read(0xCB),
        fsl=ec.ec_read(0x77),
    )


def set_fan(passive):
    return command(0x79, 0x05 if passive else 0x00)


def set_tdp_unlocked():
    return command(0xCA, 0xFF), command(0xCB, 0xFF)


def set_tdp_locked(pl1, pl2):
    return command(0xCA, pl1), command(0xCB, pl2)


def main():
    ec.open_pawnio()
    ec.lock()
    try:
        print("before:", read_state())
        if len(sys.argv) > 1 and sys.argv[1] == "set":
            fan = int(sys.argv[2])
            pl1 = int(sys.argv[3], 0)
            pl2 = int(sys.argv[4], 0)
            print("set_fan:", set_fan(fan))
            print("set_tdp:", set_tdp_locked(pl1, pl2) if pl1 != 0xFF else set_tdp_unlocked())
            time.sleep(0.5)
            print("after :", read_state())
        elif len(sys.argv) > 1 and sys.argv[1] == "noop":
            print("noop cmd:", command(0x79, ec.ec_read(0x79)))
            print("after :", read_state())
    finally:
        ec.unlock()
        ec.pawnio.pawnio_close(ec._handle)


if __name__ == "__main__":
    main()
