#!/usr/bin/env python3

import os
import re
import sys

ARGS = sys.argv
ARGS.pop(0)

ARGS_JOINED = ''.join(ARGS).strip(' ')


def call_shell(cmd):
    os.system(cmd)


if re.match(r'[0-9]{3,6}]', ARGS_JOINED):
    call_shell('s {0}'.format(ARGS_JOINED))
elif len(ARGS_JOINED) == 10 and re.match(r'^1[45]', ARGS_JOINED):
    call_shell('c.d {0}'.format(ARGS_JOINED))
elif re.match(r'[x0-9\+\-\*/ \^]', ARGS_JOINED):
    try:
        print(eval(ARGS_JOINED.replace('x', '*')))
    except:
        print('Cannot parse the formula')
else:
    print('command not found')
