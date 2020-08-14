# development_vm

## Purpose
Build a linux virtual machine suitable for java development in the absence of assigned kit.
Assumes we're running on personal kit so the objectives are:
- Lightweight (such that it fits in assignable memory, etc)
- Self contained (such that a user doesn't have to litter their personal kit with work related files all over it)
- Automated (such that it doesn't require extensive manual intervention)


## VM description
* OS - Centos8
* Desktop - Xfce
* Dev tools - OpenJDK8, Maven, Git
* Browser - Google chrome
* IDE - VSCode
* Database - Postgres v11

## Pre-requisites
You will need to manually install onto your pc:
- VirtualBox (https://www.virtualbox.org/)
- Vagrant (https://www.vagrantup.com/)
- OpenVPN (and configure this to connect to the BSA estate)

You will also need 
- 6Gb+ of RAM in order to assign 4Gb to the vm.  More is better.
- At least 4Gb of free disk space
- An internet connection over which you're happy to load several gigs of data.  Top tip: don't use your phone.


## Setup
If you have this file, then you probable have the others, either from ther git repo
at https://github.com/philsca/development_vm or however else it was packaged.
You should have a directory *development_vm*.  All commands listed should be run from this directory.
This contains:
* Vagrantfile - A script to tell Vagrant how to build a vm withing VirtualBox
* installs.sh - A shell script to install the desktop and tools listed in the description (this is run automatically)
* shared - A folder that will be mapped to the guest development vm.
* shared\certificates - BSA Intermediate and CA certificates
* shared\scripts - Optional post-install setup utility scripts


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
	
After you've fire up the vm in graphical mode for the first time you'll probably want to adjust the vm 
screen resolution.  Right click on the VirtualBox display icon at the bottom of the window and pick an 
appropriate screen resolution and display mode to suite your monitor.

To shutdown the VM ust go to the development_vm directory is a command line and run:

    vagrant halt

This will perform a clean shutdown of the environment.

## Configuring the environment

### User configuration

Edit the file ~/shared/scripts/user_env.sh
Set your own name, email address etc.

### SSH key generation
If you already have an ssh key to use then you can copy the key directly to ~/.ssh
If not, then the script ~/shared/scripts/generate_ssh_key.sh will generate a new ssh key suitable for upload to your git profile.
You'll be prompted for a password for your private key.

### Certificate installation
You'll need to setup the VM to trust the BSA CA certificates.
Run the script ~/shared/scripts/install_ca_certs.sh to do this.
This will install the certs both to the OS and to the java trust store.
(Note: - when prompted for the trust store password, it's "changeit").






