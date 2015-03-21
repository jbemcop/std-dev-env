#!/bin/bash -eux

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
