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

