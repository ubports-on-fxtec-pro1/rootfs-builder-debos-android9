### Debos build recipies

This uses debos to build (sdcard) images for devices


Supported devices:
 - Pine64 using lima (can be built with mali blobs also)
    - PinePhone (dev board and final version)
    - PineTab
    - PineBook
 - Raspberry pi (all version after 3)
 - Librem 5 (dev board)
 - Generic images (for qemu, virtual box)


To build images locally, run:
```
debos -m 5G (device).yaml
```

or use docker:

To install:
```
git clone https://github.com/JBBgameich/debos-docker
cd debos-docker
ln -s $(readlink -f run.sh) ~/bin/debos-docker
```

then cd into this repo:
```
debos-docker -m 5G (device).yaml
```

NOTE: this uses 5G of ram, you might be able to decreases this, but may run into
space issues if you do.
