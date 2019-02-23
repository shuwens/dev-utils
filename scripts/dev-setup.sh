#!/bin/bash
set -ex

sudo apt-get install -y python-virtualenv python3-dev python3 python3-venv

mkdir -p ~/.config && cd ~/.config && git clone  https://github.com/jethrosun/yavc.git -b neovim nvim

rustup install nightly
rustup default nightly
rustup component add rls rust-analysis rust-src
