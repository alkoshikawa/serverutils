#!/bin/sh

PUBLICIP=`curl http://169.254.169.254/latest/meta-data/public-ipv4`
echo 'export PS1="\[\033[1;32m\][\u@\h(PUBLICIP) \W]\\$\[\033[0m\] "' | sed -e "s/PUBLICIP/${PUBLICIP}/g" > /etc/profile.d/testenv.sh
