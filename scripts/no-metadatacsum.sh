#!/bin/bash

MOUNTPATH=$(realpath mnt/$1)
PART=$(df "$MOUNTPATH" | tail -1 | awk '{ print $1 }')

umount -l $PART
e2fsck -f $PART
tune2fs -f -O ^metadata_csum $PART
mount $PART $MOUNTPATH
