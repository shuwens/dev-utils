#!/bin/bash
set -ex

sudo apt-get install -y python-virtualenv python3-dev python3 python3-venv

curl -sL install-node.now.sh/lts | sudo bash
# Optional install yarn if you want install extension by CocInstall command
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

pip install neovim
#pip3 install neovim
python3 -m pip install neovim

mkdir -p ~/.config && cd ~/.config && git clone  https://github.com/jethrosun/yavc.git -b neovim nvim

