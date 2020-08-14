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
#sudo dnf check-update
sudo dnf install -y code

#
# Browser.  
# Chromium is reasonably close to chrome and is in the default repos.
# Google chrome is a bit more problematic
#echo "Installing chromium"
#sudo dnf install -y chromium

# Note: removed Chromium install as it does not play nicely with pgAdmin below.
# Seems not to register with desktop as default browser, which causes pgAdmin4 startup to barf.
# Switching to Google Chrome fixed it for me.
echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo yum install -y ./google-chrome-stable_current_*.rpm


#
# Postgres v11
# Disable the built-in PostgreSQL module:
sudo dnf -qy module disable postgresql

# Install the repository RPM from postgresql.org
# Note: url is specific to Centos v8
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm


# Install PostgreSQL v11:
sudo dnf install -y postgresql11-server

# initialize the database and enable automatic start:
sudo /usr/pgsql-11/bin/postgresql-11-setup initdb
sudo systemctl enable postgresql-11
sudo systemctl start postgresql-11

#
# pgAdmin4
sudo rpm -i https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-redhat-repo-1-1.noarch.rpm
sudo yum install -y pgadmin4-desktop






