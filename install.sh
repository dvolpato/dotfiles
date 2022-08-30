#!/bin/sh

./apt.sh

pushd dotfiles &> /dev/null
./install.sh
popd  &> /dev/null

# Needs to be sourced otherwise $ZSH_CUSTOM is not set
source ./shell-zsh.sh

./shell-bash.sh
