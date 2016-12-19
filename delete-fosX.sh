#!/bin/bash

virsh destroy fosX
virsh undefine fosX

echo ">>--> Deleting fosX qcow2, cfgdrive, & logdisk"
rm -fR /var/lib/libvirt/images/fosX/
