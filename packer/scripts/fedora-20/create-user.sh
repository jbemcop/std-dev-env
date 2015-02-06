#!/bin/bash -eux

echo "Reading config.properties..."
. /home/vagrant/config.properties

echo "Creating User $vm_user"
adduser -G wheel $vm_user
echo "$vm_pass" | passwd "$vm_user" --stdin
