#!/bin/bash

#burst shot
function do_test_long_press()
{
echo "+++++++burst shot+++++++"
adb shell monkey -p org.codeaurora.snapcam -v 1 > /dev/null  2>&1 
sleep 1
#long press for 5000ms
adb shell input swipe 500 1700 500 1700 5000
sleep 1
adb shell input keyevent 3
sleep 1
}


#one shot
function do_test()
{
echo "+++++++one shot++++++"
#lunch camera
adb shell monkey -p org.codeaurora.snapcam -v 1 > /dev/null  2>&1 
sleep 1
#拍照 adb shell input press
adb shell input tap 500 1700
sleep 1
#home 键
adb shell input keyevent 3
sleep 1
}

for((i=0;i<40;i++))
do 
    echo "the $i times"
    do_test
    sleep 1
    do_test_long_press
done
