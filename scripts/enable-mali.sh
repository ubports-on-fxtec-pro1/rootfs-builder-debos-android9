#!/bin/sh

ARCH=$(dpkg --print-architecture)

case $ARCH in
    arm64)
        DEB_HOST_MULTIARCH="aarch64-linux-gnu"
        ;;
    armhf)
        DEB_HOST_MULTIARCH="arm-linux-gnueabihf"
        ;;
    amd64)
        DEB_HOST_MULTIARCH="x86_64-linux-gnu"
        ;;
esac

echo "making mali the default alternatives for "$DEB_HOST_MULTIARCH"_egl_conf"
echo "/usr/lib/$DEB_HOST_MULTIARCH/" > /usr/lib/$DEB_HOST_MULTIARCH/ld.so.conf
update-alternatives --force --install /etc/ld.so.conf.d/${DEB_HOST_MULTIARCH}_EGL.conf ${DEB_HOST_MULTIARCH}_egl_conf /usr/lib/${DEB_HOST_MULTIARCH}/ld.so.conf 500

# ldconfig needs to be run immediately as we're changing /etc/ld.so.conf.d/ with alternatives.
LDCONFIG_NOTRIGGER=y ldconfig

# Fix mali bug
cd /usr/lib/$DEB_HOST_MULTIARCH
ln -s libwayland-egl.so libwayland-egl.so.1