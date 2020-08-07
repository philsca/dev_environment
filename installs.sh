#!/bin/bash -e

# Quick check if shared folders mounted here
if test -f ~/shared/marker.txt; then
  echo "Shared marker file found"
else
  echo "Shared marker file NOT found"
fi

#
# Graphical desktop.  
# Gnome is probably too heavyweight for a VM on personal kit.  
# KDE Plasma seems to be missing from the Centos default repos (or have dependencies which are)
# Xfce is lightweight, available in the repo, and simple
sudo  dnf groupinstall -y "Xfce"
sudo systemctl set-default graphical.target


#
# Java & general dev tools.  Will require config for git (and possibly maven)
echo "Installing OpenJdk..."
sudo dnf install -y java-1.8.0-openjdk-devel

echo "Installing Maven..."
sudo dnf install -y maven

echo "Installing Git..."
sudo dnf install -y git

#
# IDE.  VSCode is a reasonable choice for a lightweight env.
echo "Installing VSCode..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install -y code

#
# Browser.  
# Chromium is reasonably close to chrome and is in the default repos.
# Google chrome is a bit more problematic
echo "Installing chromium"
sudo dnf install -y chromium

# TODO
# - OpenVPN
# - NHSBSA's cert authority
# - User-specific config 
#     (may be better to move this out of provisioning and into a manually triggered script)
#
#




