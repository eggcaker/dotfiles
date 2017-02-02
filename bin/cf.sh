#!/bin/bash

for file in *.md; do 
  d="${file:0:10}";
  echo $d; 
  tt=`echo $file|wc -m`
  fn="${file:11:$tt}";
  cp $file  $fn;
  cat $fn| sed -e "s/layout\: post/\nlayout: 'article'\nauthor: 'eggcaker'\ndate: '$d'\n/g" | sed -e 's/--- /---\n/g'| sed -e 's/ ---/\n---/g'  >tmp
  mv tmp $fn

done


