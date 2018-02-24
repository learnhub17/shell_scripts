#!/bin/bash
# author = Sumit
# mail = sumit.anand@orkash.com
###Calculate the RAM########
RAM=`grep MemTotal /proc/meminfo | awk '{print $2}' | cut -c 1`
TOTALRAM=`grep MemTotal /proc/meminfo | awk '{print $2}'`

#####Calculate the CPU Load#######
CPU=`grep -c ^processor /proc/cpuinfo`
loadavg=`uptime |cut -d , -f 4|cut -d : -f 2 `
#thisloadavg=`echo $loadavg|awk -F \. '{print $1}'`
thisloadavg=`echo $loadavg| awk ' { print $1 }'`

###Find the process#####
JAVA=$(ps -ef | grep -v grep | grep java | awk '{ print $2}')

###########LOG Dir####
LOG=script.log

#####threshold level########
#thre=`expr $CPU + $RAM  ` / 100 * 35  | bc -l 
thre=`expr $CPU + $RAM `
###75%%load####
thre1=`expr " $thre / 100 * 35 " |bc -l `
####80%load#####
thre2=`expr " $thre / 100 * 40 " | bc -l`
date >> $LOG
echo "Script started =====================" >> $LOG
if [ "$CPU" -ne "$RAM" ];then
        echo "RAM and CPU is different" >> $LOG
        echo "total RAM is $RAM" >> $LOG
        echo "total CPU is $CPU" >> $LOG
        echo "total load is $loadavg" >> $LOG
  echo "Step 1 done =======" >> $LOG
if [ $(echo "$thisloadavg > $thre1 " | bc) -eq 1  ];then >> $LOG
        echo "Java PID $JAVA" >> $LOG
        echo "total load is $loadavg" >> $LOG
        kill $JAVA
echo "Step 1.1 done ===" >> $LOG
fi
        else
echo "Step:2"    >> $LOG
if [ "$CPU" -eq "$RAM" ];then
        echo "RAM and CPU is equal" >> $LOG
        echo "total RAM is $RAM" >> $LOG
        echo "total CPU is $CPU" >> $LOG
        echo "total load is $loadavg" >> $LOG
  echo "Step 2 done =======" >> $LOG
if [ $(echo "$thisloadavg > $thre2" | bc) -eq 1  ];then >> $LOG
        echo "Java PID $JAVA" >> $LOG
        echo "total load is $loadavg" >> $LOG
        kill $JAVA
echo "Step 2.1 done ===" >> $LOG
fi
fi
fi

