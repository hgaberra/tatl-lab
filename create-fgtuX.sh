#!/bin/bash

echo '>>--> Creating directories'
mkdir -p /var/lib/libvirt/images/fgtuX

echo ">>--> Cloning orig qcow2, usbdrive, & logdisk"
cp /var/lib/libvirt/images/orig/fgt5.4.1.qcow2.orig /var/lib/libvirt/images/fgtuX/fortios.qcow2
cp /var/lib/libvirt/images/orig/logdisk.qcow2.orig /var/lib/libvirt/images/fgtuX/logdisk.qcow2
cp /var/lib/libvirt/images/orig/usb.img.orig /var/lib/libvirt/images/fgtuX/usb.img

virt-install --connect qemu:///system \
--name fgtuX \
--ram 1024 \
--disk path=/var/lib/libvirt/images/fgtuX/fortios.qcow2,device=disk,format=qcow2,bus=virtio,cache=none \
--disk path=/var/lib/libvirt/images/fgtuX/logdisk.qcow2,device=disk,format=qcow2,bus=virtio,cache=none \
--disk path=/var/lib/libvirt/images/fgtuX/usb.img,device=disk,bus=usb \
--vcpus=4 \
--os-type=linux \
--nographics \
--import \
--network network:br-em1,model=virtio \
--network network:br-p6p1,model=virtio \
--network network:br-p6p2,model=virtio
