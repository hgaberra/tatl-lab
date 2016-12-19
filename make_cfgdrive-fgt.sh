#!/bin/bash

echo ">>--> Making temp dirs for iso"
mkdir -p /tmp/tmpdir/openstack/content
mkdir -p /tmp/tmpdir/openstack/latest

echo ">>--> Copying fgt lic & cli files"
cp fgtlic.txt /tmp/tmpdir/openstack/content/0000
cp fgtcli.txt /tmp/tmpdir/openstack/latest/user_data
echo '{"files": [{"path": "license", "content_path": "/content/0000"}]}' > /tmp/tmpdir/openstack/latest/meta_data.json

#echo ">>--> Setting permissions"
#chmod 555 /tmp/tmpdir/openstack/content
#chmod 555 /tmp/tmpdir/openstack/latest
#chmod 444 /tmp/tmpdir/openstack/content/0000
#chmod 444 /tmp/tmpdir/openstack/latest/user_data

echo ">>--> Generating iso image"
genisoimage -V config-2 -J -R -o cfgdrive.fgt.orig /tmp/tmpdir

echo ">>--> Deleting tmpdir"
rm -rf /tmp/tmpdir/

#echo ">>--> Copy image to libvirt/images as a template"
#if [ -e /var/lib/libvirt/images/cfgdrive.fgt.orig ]
#then
#	rename=$(date +%-b%-d-%-H:%-M)
#	mv /var/lib/libvirt/images/cfgdrive.fgt.orig /var/lib/libvirt/images/cfgdrive.fgt.$rename.orig
#	mv cfgdrive.fgt.orig /var/lib/libvirt/images/cfgdrive.fgt.orig
#else
#	mv cfgdrive.fgt.orig /var/lib/libvirt/images/cfgdrive.fgt.orig
#fi
