#!/bin/bash

virsh destroy fgtcXmq
virsh undefine fgtcXmq

echo ">>--> Deleting fgtcXmq qcow2, cfgdrive, & logdisk"
rm -fR /var/lib/libvirt/images/fgtcXmq/
