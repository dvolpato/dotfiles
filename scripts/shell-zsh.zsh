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

USER_ZSH_PATH=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

echo "[zsh] Install plugins..."

echo "[zsh] Plugin: zsh-autosuggestions"
rm -rf "${USER_ZSH_PATH}/plugins/zsh-autosuggestions"
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "${USER_ZSH_PATH}/plugins/zsh-autosuggestions"

echo "[zsh] Plugin: zsh-syntax-highlighting"
rm -rf "${USER_ZSH_PATH}/plugins/zsh-syntax-highlighting"
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "${USER_ZSH_PATH}/plugins/zsh-syntax-highlighting"

echo "[zsh] Plugin: zsh-tmux-auto-title"
rm -rf "${USER_ZSH_PATH}/plugins/zsh-tmux-auto-title"
git clone --depth=1 https://github.com/mbenford/zsh-tmux-auto-title "${USER_ZSH_PATH}/plugins/zsh-tmux-auto-title"


echo "[zsh] Install themes..."
echo "[zsh] Theme: powerlevel10k"
rm -rf ${USER_ZSH_PATH}/themes/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${USER_ZSH_PATH}/themes/powerlevel10k

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
