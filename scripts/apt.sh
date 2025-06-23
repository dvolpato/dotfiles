#!/bin/sh

APPS="
fonts-powerline
make
git
tmux
zsh
"

echo "[apt] Updating"
sudo apt-get -y update

echo "[apt] Installing apps: $APPS"

sudo apt-get -y -q install $APPS

echo ""
echo "[apt] Done"
