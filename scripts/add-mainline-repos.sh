#!/bin/sh

# Hack my damn network!
rm -f /etc/resolv.conf
echo "nameserver 1.1.1.1" > /etc/resolv.conf

echo "deb http://repo.ubports.com/ xenial_-_edge_-_mesa main" >> /etc/apt/sources.list.d/ubports.list
echo "deb http://repo.ubports.com/ xenial_-_edge_-_pine main" >> /etc/apt/sources.list.d/ubports.list

apt update
apt upgrade -y
apt autoremove -y

apt install ubuntu-touch-session-wayland -y