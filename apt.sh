#!/bin/sh

APPS="
fonts-powerline
make
meld
git
tmux
zsh
"

echo "[apt] Installing apps: $APPS"

sudo apt-get -y -q install $APPS

echo ""
echo "[apt] Done"
