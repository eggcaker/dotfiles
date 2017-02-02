#!/bin/bash


URL="http://news.163.com/special/qingsongyike/"


wget -O tmp.html $URL  > /dev/null 2>&1
cat tmp.html|iconv -f gbk -t utf-8 > tmp2.html
mv tmp2.html tmp.html


