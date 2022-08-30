#!/bin/sh

./apt.sh

pushd dotfiles &> /dev/null
./install.sh
popd  &> /dev/null
