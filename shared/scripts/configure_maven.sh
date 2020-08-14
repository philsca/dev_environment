#!/bin/bash
if [ ! -d ~/.m2 ]; then
  mkdir ~/.m2
fi

if [ -f ~/.m2/settings.xml ]; then
  echo "Maven settings already present - NOT overwriting"
else
  echo "Copying maven settings..."
  cp ~/shared/scripts/maven/settings.xml  ~/.m2/
fi