#!/bin/bash

echo '>>--> Creating directories'
mkdir -p /var/lib/libvirt/images/fgtuXucpe

echo ">>--> Cloning orig qcow2, usbdrive, & logdisk"
cp /var/lib/libvirt/images/orig/fgt5.2.7.qcow2.orig /var/lib/libvirt/images/fgtuXucpe/fortios.qcow2
cp /var/lib/libvirt/images/orig/logdisk.qcow2.orig /var/lib/libvirt/images/fgtuXucpe/logdisk.qcow2

virt-install --connect qemu:///system \
--name fgtuXucpe \
--ram 1024 \
--disk path=/var/lib/libvirt/images/fgtuXucpe/fortios.qcow2,device=disk,format=qcow2,bus=virtio,cache=none \
--disk path=/var/lib/libvirt/images/fgtuXucpe/logdisk.qcow2,device=disk,format=qcow2,bus=virtio,cache=none \
--vcpus=4 \
--os-type=linux \
--nographics \
--import \
--network network:br-em1,model=virtio \
--network network:br-p6p1,model=virtio \
--network network:br-p6p2,model=virtio \
--network network:default,model=virtio \
--network network:default,model=virtio \
--network network:default,model=virtio \
--network network:default,model=virtio \
--network network:default,model=virtio \
--network network:default,model=virtio \
--network network:default,model=virtio


#cp /var/lib/libvirt/images/orig/usb.img.orig /var/lib/libvirt/images/fgtuXucpe/usb.img
#--disk path=/var/lib/libvirt/images/fgtuXucpe/usb.img,device=disk,bus=usb \
