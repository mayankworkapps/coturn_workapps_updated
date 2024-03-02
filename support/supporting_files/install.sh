#!/bin/bash

# Epel installation script

#sudo yum -y install epel-release


for i in *.rpm ; do
      sudo rpm -ivh --nodeps ${i}
done
mkdir -p /home/workapps/video/certs
mkdir -p /home/workapps/video/logs
tar -xzvhf supporting_libs.tar.gz
cp -R libs /home/workapps/video/
cp -f supporting_files/turnserver.service /usr/lib/systemd/system/turnserver.service
cp -f supporting_files/turnserver /etc/sysconfig/turnserver
sudo systemctl enable turnserver.service

echo SUCCESS !

