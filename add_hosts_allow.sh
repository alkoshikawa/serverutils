#!/bin/bash

IP=$1
TYPE=$2

if [ "$IP" = ""  ]; then
  echo "usage: $0 {ip}"
  exit
fi

if [ "$TYPE" = "" ]; then
  TYPE=sshd
fi

echo "${TYPE}: ${IP}" >> /etc/hosts.allow
