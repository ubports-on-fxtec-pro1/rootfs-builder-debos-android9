#!/bin/sh

# FIXME
#DEB_HOST_MULTIARCH=$(dpkg-architecture -qDEB_HOST_MULTIARCH)
DEB_HOST_MULTIARCH="aarch64-linux-gnu"

echo "making libhybris the default alternatives for "$DEB_HOST_MULTIARCH"_egl_conf"
update-alternatives --set $DEB_HOST_MULTIARCH"_egl_conf" /usr/lib/$DEB_HOST_MULTIARCH/mesa-egl/ld.so.conf

# ldconfig needs to be run immediately as we're changing /etc/ld.so.conf.d/ with alternatives.
LDCONFIG_NOTRIGGER=y ldconfig