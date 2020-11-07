#!/bin/bash
set -ex

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update

# python-virtualenv
sudo apt-get install -y python3-dev python3 python3-venv python3-pip neovim

curl -sL install-node.now.sh/lts | sudo bash
# Optional install yarn if you want install extension by CocInstall command
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

pip3 install neovim
#pip3 install neovim
python3 -m pip install neovim

cd ~/dev/others/rust-analyzer || (mkdir -p ~/dev/others && cd ~/dev/others && git clone https://github.com/rust-analyzer/rust-analyzer.git && cd ~/dev/others/rust-analyzer)
cargo xtask install --server

cd ~/.config/nvim || (mkdir -p ~/.config && cd ~/.config && git clone  https://github.com/jethrosun/yavc.git  nvim)
nvim +PlugInstall +PlugClean +PlugUpdate +UpdateRemotePlugins +qall!
