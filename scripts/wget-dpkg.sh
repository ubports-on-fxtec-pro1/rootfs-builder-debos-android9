#!/bin/sh

# This is a hack to fix the damn network problems with debos/fakemachine

# Hack my damn network!
rm -f /etc/resolv.conf || true
echo "nameserver 1.1.1.1" > /etc/resolv.conf

mkdir -p /var/tmp/inst
cd /var/tmp/inst
wget $1
dpkg -i *.deb
rm -r /var/tmp/inst