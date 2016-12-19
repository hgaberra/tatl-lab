#!/bin/bash

virsh destroy fgtXsriov
virsh undefine fgtXsriov

echo ">>--> Deleting fgtuX qcow2, usbdisk, & logdisk"
rm -fR /var/lib/libvirt/images/fgtXsriov/
