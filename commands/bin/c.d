#!/usr/bin/env python3

import pendulum as pt
import sys

now = pt.now()

if (len(sys.argv) == 1):
    print(int(now.timestamp()))
else:
    if (sys.argv[1].isdigit()):
        time_stamp = int(sys.argv[1])
        time_stamp = time_stamp if time_stamp < 6489546000 else time_stamp / 1000
        print(now.fromtimestamp(time_stamp))
    else:
        print(int(now.timestamp()))
