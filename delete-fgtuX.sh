#!/bin/bash

virsh destroy fgtuX
virsh undefine fgtuX

echo ">>--> Deleting fgtuX qcow2, usbdisk, & logdisk"
rm -fR /var/lib/libvirt/images/fgtuX/
