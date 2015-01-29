# JBEM CoP Standard Migration Environment
This repo contains the scripts and code necessary to build a standard development environment that can be used for migrating JBoss based applications.

## Environment Information
The default VM that is built and configured is a VirtualBox VM that can be run on any OS. The VM is built on Fedora 20 x64 and contains the following software packages:
 - Gnome 3
 - Firefox

## Running the Environment
Follow the steps below to build the Environment
  - Install the Required Software
    - [Packer v0.7.5 or Greater](https://packer.io/downloads.html)
      - Create a new directory, `/opt/packer` on your hdd
      - Extract the contents of the Packer zip to `/opt/packer`
      - Add `/opt/packer` to your PATH environment variable
    - [VirtualBox v4.3.20 or Greater](https://www.virtualbox.org/wiki/Downloads)
    - [Vagrant v1.7.2 or Greater](https://www.vagrantup.com/downloads.html)
  - Change to `<SRC_ROOT>/packer` directory
  - Run `packer build -only=virtualbox-iso fedora-20-x86_64.json`
    - The Fedora ISO is upwards of 4gb in size and as a result may take awhile to download.
  - Packer will Launch a VirtualBox VM for the Installation. Do not Disturb it.
    - Completed build will be located at `<SRC_ROOT>/builds/virtualbox/jbemcop_fedora-21_base.box`
  - Change to `<SRC_ROOT>/vagrant` directory
  - Add the Vagrant Base image to Vagrant by running:
    - `vagrant box add jbemcop-fedora20-base ../builds/virtualbox/jbemcop_fedora-20_base.box`
  - Run `vagrant up` to Start VM

## Additional Vagrant Commands
These commands can be used to control the VM. All should be executed from the `vagrant` directory.
  - vagrant suspend - Suspends the VM
  - vagrant resume - Resumes the VM
  - vagrant halt - Shuts down the VM
  - vagrant up - Runs the VM (Will Provision if it is a new VM)
  - vagrant destroy - Destroys the VM so it can be recreated using `vagrant up`

## Default VM Information
The VM that is created has the following default user accounts
 - root:vargrant
 - vagrant:vagrant

The following directories are shared by default with the VM
 - vagrant -> /vagrant
 - shared_data -> /shared_data
  - It is recommended that any user data that needs to be shared is placed here

## FAQ

#### Why does Download Progress stay at 0% when running Packer?
When downloading the Fedora 20 ISO, the download progress may stay at 0%. This is not a problem with the scripts or Packer, but a problem with the Fedora Server not returning a proper file size for the ISO. This can safely be ignored as the image will still be downloaded.

#### Do I have to download that ISO everytime I run Packer?
No. Packer will cache the ISO and re-use it the next time you run it.

#### I just want to restart the VM, do I need to run Packer?
No. If you just want to wipe away your current VM and start over, you do not need to rebuild the base box with Packer. Simply run `vagrant destroy` from `<SRC_ROOT>/vagrant` and it will wipe away your current VM. Running `vagrant up` will create a new VM and re-run all of the provisioning steps to set it back to the default state.
