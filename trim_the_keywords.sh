#!/bin/bash                
                           
if [ $# -eq 0 ];then          
    echo "no file indicated"                                                                                                                                     
    exit 1                 
fi                         
                           
debug=false                
                           
file=$1                    
                           
#back up                   
if [ ! -f "${1}.bk" ];then 
    cp -f $1{,.bk}         
fi                         
keywords="audio_hw_primary SPRDAVCEncoder VSP isp_smart_light ThermalSensor NuPlayerDriver BatteryMeterView ThermalMonitor AudioPolicyManager\
    ┊   ┊ AudioFlinger"       
                           
if $debug;then             
  for i in $keywords;         
  do                       
    ┊ echo $i              
  done                     
fi                         
                           
                           
for i in $keywords;        
do                         
    sed -i '/'$i'/d' $file 
    [ $? -eq 0  ] && echo "Successfully deleted the line has \"$i\"" || echo "Failed to delete \"$i\" line"
done                       
