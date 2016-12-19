#!/bin/bash

echo '>>--> Creating directories'
mkdir -p /var/lib/libvirt/images/fgtXsriov

echo '>>--> Cloning orig qcow2, cfgdrive, & logdisk'
cp /var/lib/libvirt/images/orig/fgt5.4.1.qcow2.orig /var/lib/libvirt/images/fgtXsriov/fortios.qcow2
cp /var/lib/libvirt/images/orig/cfgdrive.fgtXsriov.orig /var/lib/libvirt/images/fgtXsriov/cfgdrive.iso
cp /var/lib/libvirt/images/orig/logdisk.qcow2.orig /var/lib/libvirt/images/fgtXsriov/logdisk.qcow2

echo '>>--> Defining & starting VM'
virsh define /var/lib/libvirt/images/orig/fgtXsriov.xml
virsh start fgtXsriov
virsh console fgtXsriov
