#!/bin/bash -eux

echo "Reading config.properties..."
. /home/vagrant/config.properties

echo "Setting Maven Settings"
mkdir ~$vm_user/.m2
mv ~vagrant/settings.xml ~$vm_user/.m2/settings.xml
chown -R $vm_user:$vm_user ~$vm_user/.m2

echo "Extracting Maven Repos"
for file in ~vagrant/filesToCopy/mavenRepos/*.zip
do
  echo "Extracting Repo $file ..."
  unzip -u $file -d /opt/maven/repo/
done

echo "Moving Install Files"
mkdir ~$vm_user/installers
for file in ~vagrant/filesToCopy/productInstallers
do
  echo "Relocating Installer $file ..."
  cp $file ~$vm_user/installers
done
chown -R $vm_user:$vm_user ~$vm_user/installers
