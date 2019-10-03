#!/bin/sh

# This is a hack to fix the damn network problems with debos/fakemachine

# Hack my damn network!
mv /etc/resolv.conf /etc/resolv2.conf
echo "nameserver 1.1.1.1" > /etc/resolv.conf

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

apt update
apt install -y $@

# Bring back my damn network
rm /etc/resolv.conf
mv /etc/resolv2.conf /etc/resolv.conf
