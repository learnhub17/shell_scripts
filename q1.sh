#!/bin/bash
DATE=`date`
for i in `cat log.txt`
do
echo -e "`date` $i"
sleep 5
done
