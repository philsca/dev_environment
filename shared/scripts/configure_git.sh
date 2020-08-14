#!/bin/bash
gc=~/.gitconfig
if [ -f $gc ]; then
  echo "Git config already present - NOT overwriting"
else
  . ~/shared/scripts/user_env.sh
  echo "[user]" >> $gc
  echo $'\t'"email = $USER_EMAIL_ADDRESS" >> $gc
  echo $'\t'"name = $USER_FULL_NAME" >> $gc
  echo "Created .gitconfig file:"
  cat $gc
fi
