#!/bin/sh

# Hack my damn network!
rm -f /etc/resolv.conf
echo "nameserver 1.1.1.1" > /etc/resolv.conf

REPO=$1
PRI=$2

echo "deb http://repo.ubports.com/ $REPO main" >> /etc/apt/sources.list.d/ubports.list

echo "" >> /etc/apt/preferences.d/ubports.pref
echo "Package: *" >> /etc/apt/preferences.d/ubports.pref
echo "Pin: origin repo.ubports.com" >> /etc/apt/preferences.d/ubports.pref
echo "Pin: release o=UBports,a=$REPO" >> /etc/apt/preferences.d/ubports.pref
echo "Pin-Priority: $PRI" >> /etc/apt/preferences.d/ubports.pref

apt update
apt upgrade -y --allow-downgrades
apt autoremove -y