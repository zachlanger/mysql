#!/bin/bash
# Run in docker terminal

cd jenkins_files

IPADDRESS1=$(docker inspect -f '{{.NetworkSettings.IPAddress}}' ubuntu_slave)
IPADDRESS2=$(docker inspect -f '{{.NetworkSettings.IPAddress}}' ubuntu_slave2)

sed "s/IPADDRESS/$IPADDRESS1/" slave1/config > slave1/config.xml
sed "s/IPADDRESS/$IPADDRESS2/" slave2/config > slave2/config.xml

docker cp ubuntu_slave:/root/.ssh/authorized_keys $PWD/
docker cp ubuntu_slave:/root/.ssh/id_rsa $PWD/
docker build -t zlanger/dockerjenkins .
docker run -p 8080:8080 --name jenkins --privileged -d zlanger/dockerjenkins

rm authorized_keys
rm id_rsa
