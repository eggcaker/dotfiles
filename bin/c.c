#!/usr/bin/env python

import sys

sys.argv.pop(0)

FORMULA = "".join(sys.argv)
print(eval(FORMULA))
