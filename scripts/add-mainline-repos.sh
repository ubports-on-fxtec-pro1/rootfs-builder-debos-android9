#!/bin/sh

echo "deb http://repo.ubports.com/ xenial-_edge_-_mesa main" >> /etc/apt/sources.list.d/ubports.list
echo "deb http://repo.ubports.com/ xenial-_edge_-_pine main" >> /etc/apt/sources.list.d/ubports.list

apt update
apt upgrade -y
apt autoremove -y

apt install ubuntu-touch-session-wayland -y