#!/bin/sh

USER_FONTS_DIR="$HOME/.local/share/fonts"

# Recommended by powerline10k (zsh)
meslo="
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/Me'sloLGS%20NF%20Italic.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
"

echo "[fonts] Begin"

echo "[fonts] Downloading fonts: meslo"
for url in $meslo; do
  wget --quiet --show-progress -P "$USER_FONTS_DIR" "$url"
done

echo "[fonts] Reloading font cache"
fc-cache -f -v

echo "[fonts] Installing JetBrains Mono"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

echo ""
echo "[fonts] Done"
