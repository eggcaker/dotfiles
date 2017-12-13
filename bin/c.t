#!/bin/bash


word="$1";
url="http://www.iciba.com/$word";
wget -q  -O /tmp/word.html $url >/dev/null 2>&1

#cat /tmp/word.html |grep -e '<span class="label_list">.*</span>'

mpg123 -q $(cat /tmp/word.html|grep -e 'resource/amp3/1/0'|grep -o "http://[a-z.0-9/\s\S]*mp3"|head -n 1)
rm /tmp/word.html

