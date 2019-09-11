#!/bin/bash

for boot in "$@"
do
    mkimage -A arm -O linux -T script -C none -n "U-Boot boot script" -d /boot/$boot.txt /boot/$boot.scr
    echo "Created /boot/$boot.scr from /boot/$boot.txt"
done
