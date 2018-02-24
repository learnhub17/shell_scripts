##
cd /root
date > script.log
service sshd start

####HADOOP CHECK##########
HADOOP= netstat -ntlp | grep 50070
HADOO=$?
if [ $HADOO -eq 0 ] ; then
 echo "HADOOP RUNNING" >> script.log
else
/usr/local/hadoop/sbin/start-dfs.sh >> script.log
fi

####ZOOKEEPER CHECK#########
ZOOKEEPER= netstat -ntlp | grep 2181
ZOO=$?
if [ $ZOO -eq 0 ] ; then
 echo "ZOOKEEPER RUNNING" >> script.log
/usr/local/zookeeper/bin/zkServer.sh status >> script.log
else
echo "ZOOKEEPER STarting" >> script.log
 /usr/local/zookeeper/bin/zkServer.sh start >> script.log
sleep 10
/usr/local/zookeeper/bin/zkServer.sh status >> script.log
fi

####ACCUMULO CHECK##########
ACCUMULO= netstat -ntlp | grep 50095
ACCU=$?
if [ $ACCU -eq 0 ] ; then
 echo "ACCUMULO RUNNING" >> script.log
else
/usr/local/accumulo/bin/start-all.sh >> script.log
fi

