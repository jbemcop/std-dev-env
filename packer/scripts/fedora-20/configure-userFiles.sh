#!/bin/bash -eux

echo "Reading config.properties..."
. /home/vagrant/config.properties

echo "Setting Maven Settings"
mkdir /home/$vm_user/.m2
mv /home/vagrant/settings.xml /home/$vm_user/.m2/settings.xml
chown -R $vm_user:$vm_user /home/$vm_user/.m2

echo "Extracting Maven Repos"
mkdir -p /opt/maven/repo
for file in /home/vagrant/filesToCopy/mavenRepos/*.zip
do
  echo "Extracting Repo $file ..."
  unzip -u $file -d /opt/maven/repo/
done
chown -R $vm_user:$vm_user /opt/maven/repo

echo "Moving Install Files"
mkdir /home/$vm_user/installers
for file in /home/vagrant/filesToCopy/productInstallers/*
do
  echo "Relocating Installer $file ..."
  cp $file /home/$vm_user/installers
done
chown -R $vm_user:$vm_user /home/$vm_user/installers
