#!/bin/bash

exclude_array=(
  install.sh
)

backup_dir=~/.dotfiles_bkp

###############

timestamp=$(date +%F_%H%M%S)

# Adapted from https://stackoverflow.com/a/14367368
array_contains() { 
    local array="$1[@]"
    local seeking=$2
    local in=0
    for element in "${!array}"; do
        if [[ $element == $seeking ]]; then
            in=1
            break
        fi
    done
    return $in
}

dotfiles_install() {
  for f in *; do
    # Skip files from exclude list
    $(array_contains exclude_array "$f")
    local contains=$?
    if [ $contains -eq 1 ]; then
      continue;
    fi
    
    mkdir -p $backup_dir
    
    
    target=~/.$f
    if  [ -e $target ]; then
      echo $f: making backup
      mv $target $backup_dir/$f.bkp_$timestamp
      :
    fi
    
      echo $f: installing
    cp -r $f $target
  done

  echo ""
  echo Installation done
  echo Backup available at: $backup_dir
}

dotfiles_install

