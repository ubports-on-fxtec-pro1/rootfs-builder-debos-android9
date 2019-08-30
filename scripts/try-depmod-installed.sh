#!/bin/bash

# This gets the last kernel that gets listed from dpkg. *should be latest*
kern=$(dpkg -l | grep linux-image- | tail -n1 | awk '{print $2}')
kver=${kern/linux-image-/}

echo "Found: $kver"
depmod -a $kver