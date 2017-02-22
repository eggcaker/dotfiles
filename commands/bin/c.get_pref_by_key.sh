#!/usr/bin/env bash

KEY="${1:-group_myself_account_key}"
adb shell "su -c 'mount -o rw,remount /system'"
adb shell "su -c 'cp /data/data/cc.pacer.androidapp/shared_prefs/pref_pacer.xml /mnt/sdcard/pref_pacer.xml'"
adb shell "su -c 'mount -o ro,remount /system'"
adb pull /mnt/sdcard/pref_pacer.xml .
cat pref_pacer.xml|grep "${KEY}"|sed -e 's/&quot;/"/g'|sed -e 's/<string name="'"${KEY}"'">//g'|sed -e 's/<\/string>//g'|jq ''
rm pref_pacer.xml
