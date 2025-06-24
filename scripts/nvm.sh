#!/bin/sh

echo "[nvm] Downloading and executing installer..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Add to path so we can install latest LTS
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

echo "[nvm] Installing LTS..."
nvm install --lts

echo "[nvm] Done"
