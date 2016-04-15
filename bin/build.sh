#!/bin/bash

release=$1
version=$2
imagename=openwrt-$version-x86-generic-Generic-rootfs.tar.gz

wget https://downloads.openwrt.org/$release/$version/x86/generic/$imagename
mv -f openwrt-$version-x86-generic-Generic-rootfs.tar.gz image/$imagename

docker build -t thesabbir/openwrt-x86:$release .

docker run -it --rm thesabbir/openwrt-x86:$release opkg update

git add -u

git commit -m "Updating rootfs to release $release"

git tag -f -m "Tagging $release" -a $release
