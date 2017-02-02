#!/bin/bash
android create project -p ./$1Test -k me.caker.android.$1 -a $1Activity -n $1Test -t android-22


echo "application-package=com.webcaker.$1" >> ./$1Test/build.properties
echo "main-activity=$1Activity" >> ./$1Test/build.properties

pdir=`pwd`/$1Test

cd "$pdir" 
echo "bin\ngen" >> .gitignore
git init 
git add . 
git commit -m 'init test repo'

emacsclient -n `pwd`/src/me/caker/android/$1/$1Activity.java
