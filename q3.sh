#!/bin/bash
TOTAL=0
for i in `cat file.txt`
do
TOTAL=`expr $TOTAL + $i`
done
echo -e "sum of input is $TOTAL"
