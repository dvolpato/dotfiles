#!/bin/zsh

[ -z "$ZSH_CUSTOM" ] && {
  # try to load from zshrc
  source ~/.zshrc
}

# Try once again
[ -z "$ZSH_CUSTOM" ] && {
  echo "[zsh] Cannot proceed: variable ZSH_CUSTOM not set"
  exit 1
}

echo "[zsh] Remove invalid symlinks from target dir"
pushd "$ZSH_CUSTOM" &> /dev/null
for f in *.zsh; do
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

echo "[zsh] Install new custom scripts as symlinks"
pushd shell-custom &> /dev/null
for src_file in *.sh; do
  target_file=${src_file/%.sh/.zsh}
  [ -e "$ZSH_CUSTOM/$target_file" ] && {
    echo "- Skipping installation of $src_file: symlink already exists"
    continue
  }
  echo "- Adding new custom script shell-custom/$src_file -> \$ZSH_CUSTOM/$target_file"
  ln -s $PWD/$src_file $ZSH_CUSTOM/$target_file
done
unset src_file target_file
popd &> /dev/null

echo "[zsh] Done"
