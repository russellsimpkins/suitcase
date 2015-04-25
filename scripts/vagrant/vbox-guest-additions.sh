#!/bin/sh -x
# Install VirtualBox Guest Additions

PACKAGES="gcc make perl bzip2 kernel-headers-$(uname -r) kernel-devel"
VBOX_ISO_LOC="/tmp/VBoxGuestAdditions.iso"
cp /tmp/VBoxGuestAdditions.iso /root
echo yum -y install $PACKAGES
yum -y install $PACKAGES

mount -o loop $VBOX_ISO_LOC /mnt
yum install -y kernel-devel-3.10.0-229.el7.x86_64
sh /mnt/VBoxLinuxAdditions.run --nox11
umount /mnt
if [ -f /var/log/vboxadd-install.log ]; then
    cp /var/log/vboxadd-install.log /root
fi
