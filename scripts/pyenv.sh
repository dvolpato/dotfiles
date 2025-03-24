# based on https://gist.github.com/luzfcb/1a7f64adf5d12c2d357d0b4319fe9dcd

sudo apt-get update

# install most common python interpreter itself compile dependencies
sudo apt-get install aria2 build-essential curl git libbz2-dev libffi-dev liblzma-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev llvm make tk-dev wget xz-utils zlib1g-dev --yes

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git "${HOME}/.pyenv/plugins/pyenv-virtualenvwrapper"

