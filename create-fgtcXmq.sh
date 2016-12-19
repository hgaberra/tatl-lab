#!/bin/bash

echo '>>--> Creating directories'
mkdir -p /var/lib/libvirt/images/fgtcXmq

echo ">>--> Cloning orig qcow2, cfgdrive, & logdisk"
cp /var/lib/libvirt/images/orig/fgt5.4.0.b7224.qcow2.orig /var/lib/libvirt/images/fgtcXmq/fortios.qcow2
cp /var/lib/libvirt/images/orig/cfgdrive.fgtcXmq.orig /var/lib/libvirt/images/fgtcXmq/cfgdrive.iso
cp /var/lib/libvirt/images/orig/logdisk.qcow2.orig /var/lib/libvirt/images/fgtcXmq/logdisk.qcow2

echo '>>--> Defining & starting VM'
virsh define /var/lib/libvirt/images/orig/fgtcXmq.xml
virsh start fgtcXmq
virsh console fgtcXmq
