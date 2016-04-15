#!/bin/bash

release=$1
version=$2
imagename=openwrt-$version-x86-generic-Generic-rootfs.tar.gz

echo "Buiding image for $release/$version"

wget https://downloads.openwrt.org/$release/$version/x86/generic/$imagename
mv -f openwrt-$version-x86-generic-Generic-rootfs.tar.gz image/openwrt-x86-rootfs.tar.gz

docker build -t thesabbir/openwrt-x86:$release .
docker run -it --rm thesabbir/openwrt-x86:$release opkg update
