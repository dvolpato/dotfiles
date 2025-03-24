#!/bin/bash

./scripts/apt.sh

./scripts/oh-my-zsh.sh

pushd dotfiles || exit
./install.sh
popd || exit &> /dev/null 

./scripts/fonts.sh

./scripts/shell-zsh.zsh
./scripts/shell-bash.sh

./scripts/nvm.sh

#./scripts/pyenv.sh

