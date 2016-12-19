#!/bin/bash

virsh destroy fgtcX
virsh undefine fgtcX

echo ">>--> Deleting fgtcX qcow2, cfgdrive, & logdisk"
rm -fR /var/lib/libvirt/images/fgtcX/
