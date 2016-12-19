#!/bin/bash

virsh destroy fgtcXvhuser
virsh undefine fgtcXvhuser

echo ">>--> Deleting fgtcXvhuser qcow2, cfgdrive, & logdisk"
rm -fR /var/lib/libvirt/images/fgtcXvhuser/
