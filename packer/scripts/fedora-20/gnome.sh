#!/bin/bash -eux

## Desktop
echo "Installing Gnome Desktop"
yum -y groups install "GNOME Desktop"
ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target
reboot
sleep 60
