#!/bin/sh

# This is a hack to fix the damn network problems with debos/fakemachine

# Work around resolver failure in debos' fakemachine
mv /etc/resolv.conf /etc/resolv2.conf
echo "nameserver 1.1.1.1" > /etc/resolv.conf

mkdir -p /var/tmp/inst
cd /var/tmp/inst
wget $1
dpkg -i *.deb
rm -r /var/tmp/inst

# Undo changes to work around debos fakemachine resolver
rm /etc/resolv.conf
mv /etc/resolv2.conf /etc/resolv.conf
