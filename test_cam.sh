#!/bin/bash
#check camera
function check_cam()
{
	STATUS=`adb shell "ps |grep com.android.camera2"`
	if [ -n "${STATUS}" ];then
		echo "cam ok"
	else
		echo "cam error"
		exit 1
	fi

}


#burst shot
function do_test_long_press()
{
echo "+++++++burst shot+++++++"
adb shell monkey -p org.codeaurora.snapcam -v 1 > /dev/null  2>&1 
sleep 1
#long press for 5000ms
adb shell input swipe 500 1700 500 1700 10000
#sleep 1
#adb shell input keyevent 3
#sleep 1
}
function print_cpureq()
{
echo "cpu0"
adb shell "cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq"
echo "cpu1"
adb shell "cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq"
echo "cpu2"
adb shell "cat /sys/devices/system/cpu/cpu2/cpufreq/cpuinfo_cur_freq"
echo "cpu3"
adb shell "cat /sys/devices/system/cpu/cpu3/cpufreq/cpuinfo_cur_freq"
}

#one shot
function do_test()
{
echo "+++++++take shot++++++"
#lunch camera
#adb shell monkey -p org.codeaurora.snapcam -v 1 > /dev/null  2>&1 
#sleep 1
#拍照 adb shell input press
#for snapdragon
#adb shell input tap 500 1700
#for native os CAM
adb shell input tap 500 1800
sleep 3
#home 键
#adb shell input keyevent 3
#sleep 1
}

#open camera
function open_cam()
{
echo "start camera"
echo ""
#adb shell "am start com.android.camera2"
}

for((i=0;i<1000;i++))
do 
    echo "+++++++++the $i time+++++++++++"
	check_cam
    do_test
#	print_cpureq
   # sleep 1
   # do_test_long_press
done

