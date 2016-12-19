#!/bin/bash

echo '>>--> Creating directories'
mkdir -p /var/lib/libvirt/images/fgtcXvhuser

echo ">>--> Cloning orig qcow2, cfgdrive, & logdisk"
cp /var/lib/libvirt/images/orig/fgt5.4.1.qcow2.orig /var/lib/libvirt/images/fgtcXvhuser/fortios.qcow2
cp /var/lib/libvirt/images/orig/cfgdrive.fgt.orig /var/lib/libvirt/images/fgtcXvhuser/cfgdrive.iso
cp /var/lib/libvirt/images/orig/logdisk.qcow2.orig /var/lib/libvirt/images/fgtcXvhuser/logdisk.qcow2

echo '>>--> Defining & starting VM'
virsh define /var/lib/libvirt/images/orig/fgtcXvhuser.xml
virsh start fgtcXvhuser
virsh console fgtcXvhuser

#virt-install --connect qemu:///system \
#--name fgtcXvhuser \
#--ram 4096 \
#--disk path=/var/lib/libvirt/images/fgtcXvhuser/fortios.qcow2,device=disk,format=qcow2,bus=virtio,cache=none \
#--disk path=/var/lib/libvirt/images/fgtcXvhuser/logdisk.qcow2,device=disk,format=qcow2,bus=virtio,cache=none \
#--disk path=/var/lib/libvirt/images/fgtcXvhuser/cfgdrive.iso,device=cdrom,format=raw,bus=ide,cache=none \
#--vcpus=1 \
#--os-type=linux \
#--cpu host \
#--vcpus=1,sockets=1,cores=1,threads=1 \
#--nographics \
#--import \
#--network network:br-em1,model=virtio \
#--network network:vhost-user1,model=virtio \
#--network network:vhost-user2,model=virtio
