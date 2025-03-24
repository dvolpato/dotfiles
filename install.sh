#!/bin/bash

# TODO fail on error

./scripts/apt.sh

./scripts/oh-my-zsh.sh

pushd dotfiles || exit
./install.sh
popd || exit &> /dev/null 

pushd scripts || exit
./fonts.sh

./shell-zsh.zsh
./shell-bash.sh

#./nvm.sh

#./pyenv.sh
popd || exit &> /dev/null

