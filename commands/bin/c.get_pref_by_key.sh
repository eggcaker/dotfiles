#!/usr/bin/env bash

KEY="${1:-group_myself_account_key}"
adb shell "su -c 'mount -o rw,remount /system'"
adb shell "su -c 'cp /data/data/cc.pacer.androidapp/shared_prefs/pref_pacer.xml /mnt/sdcard/pref_pacer.xml'"
adb shell "su -c 'mount -o ro,remount /system'"
adb pull /mnt/sdcard/pref_pacer.xml .
cat pref_pacer.xml|grep "${KEY}"|sed -e 's/&quot;/"/g'|awk -F'">' '{print $2}' |awk -F\" '{print $1}'
#rm pref_pacer.xml
