#!/bin/sh

if [ "$myIP" = "" ]; then
  echo "myIP not found, myIP=xxx.xxx.xxx.xxx sh $0"
  exit 1
fi

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -s ${myIP} --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -s ${myIP} --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j DROP
iptables -A INPUT -p tcp --dport 443 -j DROP
