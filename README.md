# development_vm

## Purpose
Build a linux virtual machine suitable for java development in the absence of assigned kit.
Assumes we're running on personal kit so the objectives are:
- Lightweight (such that it fits in assignable memory, etc)
- Self contained (such that a user doesn't have to litter their personal kit with work related files all over it)
- Automated (such that it doesn't require extensive manual intervention)


## VM description
OS - Centos8
Desktop - Xfce
Dev tools - OpenJDK8, Maven, Git
Browser - Chromium
IDE - VSCode

## Pre-requisites
You will need to manually install onto your pc:
- VirtualBox (https://www.virtualbox.org/)
- Vagrant (https://www.vagrantup.com/)

You will also need 
- 6Gb+ of RAM in order to assign 4Gb to the vm.  More is better.
- At least 4Gb of free disk space
- An internet connection over which you're happy to load several gigs of data.  Top tip: don't use your phone.


## Setup
If you have this file, then you probable have the others, either from ther git repo
at https://github.com/philsca/development_vm or however else it was packaged.
You should have a directory *development_vm*.  All commands listed should be run from this directory.
This contains:
Vagrantfile - A script to tell Vagrant how to build a vm withing VirtualBox
installs.sh - A shell script to install the desktop and tools listed in the description (this is run automatically)
shared - A folder that will be mapped to the guest development vm.


## Environment creation
Open a command line (windows CMD / Git bash / etc)
Change directory to development_vm
Run
  vagrant plugin install vagrant-vbguest
  
This will install a plugin to synchronise versions of glue code between your install of VirtualBox and the linux guest OS.
  
Now create the environment.  Run
  vagrant up

Now is a good time to go make coffee / have lunch / walk the dog.  It will take 20 mins to an hour.  
Note that VirtualBox will open a window inviting you to log in the vm while it's being built and configured.  Don't do that just yet.

When the vagrant script is finished, shut down the VM
  vagrant halt
  
## Environment access
To startup the VM, just go to the development_vm directory is a command line and run:
  vagrant up
  
Virtual box will open a window where you can log in to VM
Username: vagrant
Password: vagrant

To shutdown the VM ust go to the development_vm directory is a command line and run:
  vagrant halt

 This will perform a clean shutdown of the environment.
