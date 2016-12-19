#!/bin/bash

echo '>>--> Creating directories'
mkdir -p /var/lib/libvirt/images/fgtcX

echo ">>--> Cloning orig qcow2, cfgdrive, & logdisk"
cp /var/lib/libvirt/images/orig/fgt5.4.1.qcow2.orig /var/lib/libvirt/images/fgtcX/fortios.qcow2
cp /var/lib/libvirt/images/orig/cfgdrive.fgt.orig /var/lib/libvirt/images/fgtcX/cfgdrive.iso
cp /var/lib/libvirt/images/orig/logdisk.qcow2.orig /var/lib/libvirt/images/fgtcX/logdisk.qcow2

virt-install --connect qemu:///system \
--name fgtcX \
--ram 1024 \
--disk path=/var/lib/libvirt/images/fgtcX/fortios.qcow2,device=disk,format=qcow2,bus=virtio,cache=none \
--disk path=/var/lib/libvirt/images/fgtcX/logdisk.qcow2,device=disk,format=qcow2,bus=virtio,cache=none \
--disk path=/var/lib/libvirt/images/fgtcX/cfgdrive.iso,device=cdrom,format=raw,bus=ide,cache=none \
--vcpus=1 \
--os-type=linux \
--nographics \
--import \
--network network:br-em1,model=virtio \
--network network:br-p6p1,model=virtio \
--network network:br-p6p2,model=virtio
