##!/bin/bash

if [ -d ~/.bash_aliases.d ]; then
  for alias_file in ~/.bash_aliases.d/*.sh; do
    if [ -x $alias_file ]; then
#      echo "Importing aliases from: $alias_file"
      . $alias_file
    fi
  done
  unset alias_file
fi

if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*.sh; do
    if [ -x $rc ]; then
#      echo "Reading bashrc file: $rc"
      . $rc
    fi
  done
  unset rc
fi

