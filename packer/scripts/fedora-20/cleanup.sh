#!/bin/bash -eux

yum -y clean all
rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?
rm -f /home/vagrant/config.properties
rm -f /home/vagrant/settings.xml
rm -f /home/vagrant/InstallJbds.xml
rm -rf /home/vagrant/filesToCopy
