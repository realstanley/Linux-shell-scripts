#!/bin/bash
adb root
adb remount rw

#cd $OUT

while read line;
do 
	SOURCE=`echo $line | sed -n  's/Install.*\(\/system\)/\1/p'`
	TO=`echo ${SOURCE}|awk -F"/" '{for(i=1;i<NF;i++) printf $i"/"}'`
	echo "adb push .${SOURCE} ${TO}"
	adb push .${SOURCE} ${TO}
	#echo "adb push .${SOURCE} ${SOURCE}"
done < $1
