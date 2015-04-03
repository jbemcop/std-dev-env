#!/bin/bash -eux

echo "Reading config.properties..."
. /home/vagrant/config.properties

## Java 1.7
echo "Installing Java 1.7"
yum -y install java-1.7.0-openjdk

## Tools
echo "Install Tools"
yum -y install terminator
yum -y install unzip

## Dev Tools
echo "Installing Dev Tools"
yum -y install git
yum -y install maven
yum -y install subversion
yum -y install ant

## JBoss Dev Studio
echo "Installing JBDS"
mkdir /opt/jboss
chown -R $vm_user:$vm_user /opt/jboss/
sudo java -jar /home/vagrant/filesToCopy/productInstallers/jbdevstudio-product-universal-7.1.1.GA-v20140314-2145-B688.jar /home/vagrant/InstallJbds.xml

## Installing Windup
echo "Downloading Windup"
wget http://download.jboss.org/windup/windup-cli-0.6.8.zip
cp windup-cli-0.6.8.zip /home/$vm_user/installers
rm -f windup-cli-0.6.8.zip

## Installing WindRide
echo "Downloading WindRide"
wget https://repository.jboss.org/nexus/content/repositories/releases/org/jboss/migr/as/WindRide/1.0.0/WindRide-1.0.0.jar
cp WindRide-1.0.0.jar /home/$vm_user/installers
rm -f WindRide-1.0.0.jar

## Set Ownership
chown -R $vm_user:$vm_user /home/$vm_user/installers
chown -R $vm_user:$vm_user /opt/jboss/
