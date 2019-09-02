### Debos build recipies

This uses debos to build (sdcard) images for devices


Supported devices:
 - PinePhone (dev board 1) Lima and mali blobs
 - Librem 5
 - Generic images (for qemu)


To build images locally, run:
```
debos -m 5G (device).yaml
```
NOTE: this uses 5G of ram, you might be able to decreases this, but may run into
space issues if you do.
