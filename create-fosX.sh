#!/bin/bash

echo '>>--> Creating directories'
mkdir -p /var/lib/libvirt/images/fosX

echo ">>--> Cloning orig qcow2, cfgdrive, & logdisk"
cp /var/lib/libvirt/images/orig/fos5.4.0.b1050.qcow2.orig /var/lib/libvirt/images/fosX/fortios.qcow2
cp /var/lib/libvirt/images/orig/cfgdrive.fos.orig /var/lib/libvirt/images/fosX/cfgdrive.iso
cp /var/lib/libvirt/images/orig/logdisk.qcow2.orig /var/lib/libvirt/images/fosX/logdisk.qcow2

virt-install --connect qemu:///system \
--name fosX \
--ram 1024 \
--disk path=/var/lib/libvirt/images/fosX/fortios.qcow2,device=disk,format=qcow2,bus=virtio,cache=none \
--disk path=/var/lib/libvirt/images/fosX/logdisk.qcow2,device=disk,format=qcow2,bus=virtio,cache=none \
--disk path=/var/lib/libvirt/images/fosX/cfgdrive.iso,device=cdrom,format=raw,bus=ide,cache=none \
--vcpus=1 \
--os-type=linux \
--nographics \
--import \
--network network:br-em1,model=virtio \
--network network:br-p6p1,model=virtio \
--network network:br-p6p2,model=virtio
