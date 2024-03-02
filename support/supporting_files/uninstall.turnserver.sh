#!/bin/sh

for i in `rpm -q -a | grep turnserver-utils-`
do
  echo $i
  sudo rpm -e $i
done

for i in `rpm -q -a | grep turnserver-client-libs-`
do
  echo $i
  sudo rpm -e $i
done

for i in `rpm -q -a | grep turnserver.*-`
do
  echo $i
  sudo rpm -e $i
done
rm -rf /home/workapps/video/libs
rm -rf /home/workapps/video/logs
rmdir /home/workapps/video/certs 2>&1 || true
rm -f /usr/lib/systemd/system/turnserver.service
rm -f /etc/sysconfig/turnserver
