#!/bin/bash

virsh destroy fgtuXucpe
virsh undefine fgtuXucpe

echo ">>--> Deleting fgtuX qcow2, usbdisk, & logdisk"
rm -fR /var/lib/libvirt/images/fgtuXucpe/
