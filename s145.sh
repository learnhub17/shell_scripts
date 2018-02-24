#!/bin/bash
Process=AutoProcessCreaterMongoDBNewsDuccTest
JAVA=$(ps -ef | grep "$Process" | grep java | awk '{print $2}')
REPEAT=$(./ducc_install/admin/check_ducc -p -n  ducc_install/resources/np_serv.nodes|grep agent@S14[3-4])
cd
date >jobID
date >processID
echo $JAVA >>processID
##stop Job auto script###
kill $JAVA
sleep 10
#Job Process ID
PID=$(tail -n3 Uima_v6/nohup.out | awk '{print $1}' | head -n1 | sed 's/[^0-9]*//g')
echo $PID >>jobID
#stop running Job Process if any####
./ducc_install/bin/ducc_cancel --id $PID
sleep 10
stop services running on S144 and S143
./ducc_install/bin/ducc_services --stop 90
./ducc_install/bin/ducc_services --stop 92
./ducc_install/bin/ducc_services --stop 93
./ducc_install/bin/ducc_services --stop 94
./ducc_install/bin/ducc_services --stop 95
./ducc_install/bin/ducc_services --stop 96
./ducc_install/bin/ducc_services --stop 97
./ducc_install/bin/ducc_services --stop 98
sleep 60
##stop ducc agents on S144 and S143
./ducc_install/admin/stop_ducc -c agent@S144 -c agent@S143
sleep 60
./ducc_install/admin/check_ducc -p -n  ducc_install/resources/np_serv.nodes|grep agent@S14[3-4]
sleep 20
./ducc_install/admin/stop_ducc -c agent@S144 -c agent@S143
sleep 20

