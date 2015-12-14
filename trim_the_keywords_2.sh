#!/bin/bash
info()
{
cat<<END
==============================USAGE====================================================
USAGE 1:  $0 \$inputfile           #to delete the line contains default keywords
USAGE 2:  $0 \$inputfile 111 222   #to delete the line contains keywords you spefified
=======================================================================================
END
}

if [ $# -eq 0 ];then
    echo "ERROR: No input file indicated"
    info
    exit 1
fi

file=$1

#back up 
if [ ! -f "${1}.bk" ];then
    cp -f $1{,.bk}
fi


delete()
{
    sed -i '/'$1'/d' $file
    [ $? -eq 0  ] && echo "Successfully deleted \"$i\"" || echo "Failed to delete \"$i\""
}

 
if [ $# -gt 1 ]; then
    num=0;
    for i in $@;
    do
        ((num++))
        if [ $num -eq 1 ]; then
            continue
        fi
        delete $i
    done
elif [ $# -eq 1 ];then
    keywords="audio_hw_primary SPRDAVCEncoder ThermalSensor NuPlayerDriver BatteryMeterView ThermalMonitor AudioPolicyManager\
          AudioFlinger"
    echo "Will delete default keywords..."
    echo ""

    for i in $keywords;
    do 
        delete $i
    done
fi

