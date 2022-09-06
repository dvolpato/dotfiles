#!/bin/bash

./apt.sh

./oh-my-zsh.sh

pushd dotfiles || exit
./install.sh
popd || exit &> /dev/null 

./shell-zsh.zsh
./shell-bash.sh

./nvm.sh

