#!/bin/bash -eux

echo "Reading config.properties..."
. /home/vagrant/config.properties

echo "Creating User $vm_user"
adduser -G wheel $vm_user
echo "Setting Password..."
echo "$vm_pass" | passwd "$vm_user" --stdin
echo "User Created"
