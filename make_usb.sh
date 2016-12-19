#!/bin/bash

echo ">>--> Making 10 MB usb image"
dd if=/dev/zero of=usb.img.orig bs=1M count=10

echo ">>--> Formating as FAT"
mkfs fat -F usb.img.orig

echo ">>--> Making mount dir & mounting image"
mkdir -p /mnt/usbimage
mount usb.img.orig /mnt/usbimage

echo ">>--> Copying fgt conf file"
cp fgtconf.txt /mnt/usbimage/fgt_system.conf

echo ">>--> Unmounting image & deleting mount dir"
umount /mnt/usbimage
rm -rf /mnt/usbimage

echo ">>--> Copying image to libvirt/images as a template"
if [ -e /var/lib/libvirt/images/usb.img.orig ]
then
        rename=$(date +%-b%-d-%-H:%-M)
        mv /var/lib/libvirt/images/usb.img.orig /var/lib/libvirt/images/usb.img.$rename.orig
        mv usb.img.orig /var/lib/libvirt/images/usb.img.orig
else
        mv usb.img.orig /var/lib/libvirt/images/usb.img.orig
fi
