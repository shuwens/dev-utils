#!/bin/bash

set -ex

# make my life easy
sudo apt-get install -y ranger bash-completion vim build-essential neovim silversearcher-ag

# install ubuntu deps
sudo apt-get install -y libgnutls30 libgnutls-openssl-dev libcurl4-gnutls-dev libnuma-dev libpcap-dev  libsctp-dev gcc

# install kernel headers
sudo apt-get install -y linux-headers-$(uname -r)

# install clang 7.0 and cmake
sudo apt-get install -y clang-5.0 cmake

# musl
sudo apt-get install -y musl-tools

sudo apt-get install -y python-virtualenv python3-dev python3 python3-venv

# setup rust
curl https://sh.rustup.rs -sSf | sh  # Install rustup

source $HOME/.cargo/env

rustup install nightly
rustup install nightly-2019-01-08
rustup default nightly

# git repo
mkdir git && cd git && git clone https://github.com/jethrosun/NetBricks.git -b dev netbricks
