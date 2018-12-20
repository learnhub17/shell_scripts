#!/bin/bash

file=o4s-client.db
path=/data
time=1
com=0
while [ $time -ne $com ]
do
sleep 5
if [ ! -e $file ];
then
  touch "$path/$file"
fi
done
