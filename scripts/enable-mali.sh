#!/bin/sh

# FIXME
#DEB_HOST_MULTIARCH=$(dpkg-architecture -qDEB_HOST_MULTIARCH)
DEB_HOST_MULTIARCH="aarch64-linux-gnu"

echo "making mali the default alternatives for "$DEB_HOST_MULTIARCH"_egl_conf"
echo "/usr/lib/$DEB_HOST_MULTIARCH/" > /usr/lib/$DEB_HOST_MULTIARCH/ld.so.conf
update-alternatives --force --install /etc/ld.so.conf.d/${DEB_HOST_MULTIARCH}_EGL.conf ${DEB_HOST_MULTIARCH}_egl_conf /usr/lib/${DEB_HOST_MULTIARCH}/ld.so.conf 500

# ldconfig needs to be run immediately as we're changing /etc/ld.so.conf.d/ with alternatives.
LDCONFIG_NOTRIGGER=y ldconfig

# Fix mali bug
cd /usr/lib/aarch64-linux-gnu
ln -s libwayland-egl.so libwayland-egl.so.1