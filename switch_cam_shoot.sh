#!/system/bin/sh
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

#one shot
function do_test()
{
echo "+++++++take shot++++++"
input tap 500 1800
sleep 1
}

#open camera
function open_cam()
{
echo "start camera"
echo ""
am start com.android.camera2
}

#switch camera
function switch_cam()
{
echo "switch camera"
input tap 1000 100
sleep 1
}

open_cam
while :
do 
    echo "+++++++++the $i round+++++++++++"
#	check_cam
    do_test
	switch_cam
done
