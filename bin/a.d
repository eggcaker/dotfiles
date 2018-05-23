#!/usr/bin/env xonsh

import sys

print($ARG1)
print($ARGS)



$KEY = sys.argv[1]
rg -N "$KEY" ~/.dotfiles/bin/android_devices.csv
