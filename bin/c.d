#!/usr/bin/env python

import json
import os
import sys

import pendulum as p

if len(sys.argv) == 2:
    DATE_TIME_IN_SECONDS = int(sys.argv[1])
    print(p.from_timestamp(DATE_TIME_IN_SECONDS).strftime('%Y-%m-%d %H:%M:%S'))
else:
    print(p.now().int_timestamp)
