#!/bin/sh

# Hack my damn network!
mv /etc/resolv.conf /etc/resolv2.conf
echo "nameserver 1.1.1.1" > /etc/resolv.conf

echo "deb http://repo.ubports.com/ xenial_-_edge_-_mesa main" >> /etc/apt/sources.list.d/ubports.list
echo "deb http://repo.ubports.com/ xenial_-_edge_-_pine main" >> /etc/apt/sources.list.d/ubports.list

echo "" >> /etc/apt/preferences.d/ubports.pref
echo "Package: *" >> /etc/apt/preferences.d/ubports.pref
echo "Pin: origin repo.ubports.com" >> /etc/apt/preferences.d/ubports.pref
echo "Pin: release o=UBports,a=xenial_-_edge_-_mesa" >> /etc/apt/preferences.d/ubports.pref
echo "Pin-Priority: 2000" >> /etc/apt/preferences.d/ubports.pref

echo "" >> /etc/apt/preferences.d/ubports.pref
echo "Package: *" >> /etc/apt/preferences.d/ubports.pref
echo "Pin: origin repo.ubports.com" >> /etc/apt/preferences.d/ubports.pref
echo "Pin: release o=UBports,a=xenial_-_edge_-_pine" >> /etc/apt/preferences.d/ubports.pref
echo "Pin-Priority: 2000" >> /etc/apt/preferences.d/ubports.pref

apt update
apt upgrade -y --allow-downgrades
apt autoremove -y

apt install ubuntu-touch-session-wayland ubuntu-terminal-app -y

# Bring back my damn network
rm /etc/resolv.conf
mv /etc/resolv2.conf /etc/resolv.conf
