#!/bin/bash

sync_list=(

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
  echo "[dotfiles] Installing files"
  mkdir -p $backup_dir

  for f in *; do
    # Skip itself
    [[ "$f" == "install.sh" ]] && continue

    target=~/.$f

    $(array_contains sync_list "$f")
    local to_sync=$?
    if [ $to_sync -eq 1 ]; then
      echo "- $f: making backup"
      cp $target $backup_dir/$f.bkp_$timestamp
      echo "- $f: syncing"
      meld $f ~/.$f

      continue
    fi

    if [ -e $target ]; then
      echo "- $f: making backup"
      mv $target $backup_dir/$f.bkp_$timestamp
      :
    fi 

    echo "- $f: installing"
    cp -r $f $target
  done

  echo "[dotfiles] Done"
  echo "[dotfiles] Backup available at: $backup_dir"
}

dotfiles_install

