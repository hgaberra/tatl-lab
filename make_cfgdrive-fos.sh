#!/bin/bash

echo ">>--> Making temp dirs for iso"
mkdir -p /tmp/tmpdir/openstack/content
mkdir -p /tmp/tmpdir/openstack/latest

echo ">>--> Copying fos fmgaddr and cli files"
cp foscli.txt /tmp/tmpdir/openstack/content/0000
echo '{ "fmgaddress" : "10.101.101.230" }' > /tmp/tmpdir/openstack/latest/user_data
echo '{"files": [{"path": "fos-init.conf", "content_path": "/content/0000"}]}' > /tmp/tmpdir/openstack/latest/meta_data.json

#echo ">>--> Setting permissions"
#chmod 555 /tmp/tmpdir/openstack/content
#chmod 555 /tmp/tmpdir/openstack/latest
#chmod 444 /tmp/tmpdir/openstack/content/0000
#chmod 444 /tmp/tmpdir/openstack/latest/user_data
#chmod 444 /tmp/tmpdir/openstack/latest/meta_data.json
#chmod 444 /tmp/tmpdir/openstack/latest/vendor_data.json

echo ">>--> Generating iso image"
genisoimage -V config-2 -J -R -o cfgdrive.fos.orig /tmp/tmpdir 2> /dev/null

echo ">>--> Deleting temp dirs"
rm -rf /tmp/tmpdir/

echo ">>--> Copying image to libvirt/images as a template"
if [ -e /var/lib/libvirt/images/cfgdrive.fos.orig ]
then
        rename=$(date +%-b%-d-%-H:%-M)
        mv /var/lib/libvirt/images/cfgdrive.fos.orig /var/lib/libvirt/images/cfgdrive.fos.$rename.orig
        mv cfgdrive.fos.orig /var/lib/libvirt/images/cfgdrive.fos.orig
else
        mv cfgdrive.fos.orig /var/lib/libvirt/images/cfgdrive.fos.orig
fi
