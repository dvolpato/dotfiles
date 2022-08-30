#!/bin/bash

target_dir=~/.bash_aliases.d

mkdir -p $target_dir

echo "[bash] Remove invalid symlinks from target dir"
pushd "$target_dir" &> /dev/null
for f in *.sh; do
  [ ! -L "$f" ] && echo "- Keeping $PWD/$f: not a symlink" && continue

  [ -e "$f" ] && {
    echo "- Keeping $PWD/$f: symlink is not broken"
    continue
  }

  # $f is not a symlink and is broken
  echo "- Removing $PWD/$f: broken symlink"
  rm $f  
done
unset f
popd &> /dev/null

echo "[bash] Install new custom scripts as symlinks"
pushd shell-custom &> /dev/null
for src_file in *.sh; do
  target_file=$src_file
  [ -e "$target_dir/$target_file" ] && {
    echo "- Skipping installation of $src_file: symlink already exists"
    continue
  }
  echo "- Adding new custom script shell-custom/$src_file -> ~/bash_aliases.d/$target_file"
  ln -s $PWD/$src_file $target_dir/$target_file
done
unset src_file target_file
popd &> /dev/null

echo "[bash] Done"
