#!/bin/sh

ID=$(docker inspect -f '{{.Id}}' jenkins)
IPADDRESS1=$(docker inspect -f '{{.NetworkSettings.IPAddress}}' ubuntu_slave)
IPADDRESS2=$(docker inspect -f '{{.NetworkSettings.IPAddress}}' ubuntu_slave2)

sed -i -e "s/IPADDRESS1/$IPADDRESS1/" jenkins_files/slave1/config.xml
sed -i -e "s/IPADDRESS2/$IPADDRESS2/" jenkins_files/slave2/config.xml

# cp $PWD/jenkins_files/slave1/config.xml /var/lib/docker/aufs/mnt/$ID/opt/jenkins/data/nodes/slave1/

#a=$1

#while [ $a -gt 0 ]
#do
#  echo $a
#  a=`expr $a - 1`
#done
