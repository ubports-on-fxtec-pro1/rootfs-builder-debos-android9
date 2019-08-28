#!/bin/sh

# This is a hack to fix the damn network problems with debos/fakemachine

# Hack my damn network!
rm -f /etc/resolv.conf || true
echo "nameserver 1.1.1.1" > /etc/resolv.conf

apt update
apt install -y $@