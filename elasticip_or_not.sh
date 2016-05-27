#!/bin/sh

PUBLICIP=`curl -s --connect-timeout 5 --max-time 10 http://169.254.169.254/latest/meta-data/public-ipv4`

if [ "$PUBLICIP" = "" ]; then
  echo "can't get ip"
  exit 1
fi

result=`aws ec2 describe-addresses | grep "$PUBLICIP" | wc -l`

if [ $result -ne 0 ]; then
  echo "elasticip use !!"
  echo 'export PS1="\[\033[1;31m\][\u@\h \W]\\$\[\033[0m\] "'
else
  echo "elasticip not use"
fi
