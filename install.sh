#!/bin/bash

./apt.sh

pushd dotfiles || exit
./install.sh
popd || exit &> /dev/null 

./shell-zsh.zsh

./shell-bash.sh
