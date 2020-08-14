#!/bin/bash
. ./shared/scripts/user_env.sh
# default key file location, but specify it here
keyfile=~/.ssh/id_rsa

# Don't overwrite any existing key - warn user and abort
if [ -f $keyfile ]; then
  echo " ssh keyfile $keyfile already exists.  "
  echo "Please delete this first if you really want to create another"
  exit 1
fi


echo ""
echo " Generate ssh key:"
echo "   User: $USER_EMAIL_ADDRESS"
echo "   keyfile: $keyfile"
ssh-keygen -t rsa -b 4096 -C ${USER_EMAIL_ADDRESS} -f $keyfile
if [ -f $keyfile ]; then
  chmod 600 $keyfile
fi
# seems to be auto-added to ssh-agent on centos 8
#


