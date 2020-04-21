#!/bin/sh
# Systemd and friends are patched to look in /etc/writable for timezone,
# hostname, and machine type information.

set -e

for f in timezone localtime hostname machine-info; do
    echo "I: Linking /etc/$f to /etc/writable/"
    ln -sf writable/$f /etc/$f
done
