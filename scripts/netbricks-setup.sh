#!/bin/bash

set -ex

# update
sudo apt-get update

# to make sure we have everything
sudo apt-get install -y git curl libssl-dev pkg-config dpdk-igb-uio-dkms

# make my life easy
sudo apt-get install -y ranger bash-completion vim build-essential neovim silversearcher-ag tshark

# install ubuntu deps
sudo apt-get install -y libgnutls30 libgnutls-openssl-dev libcurl4-gnutls-dev libnuma-dev libpcap-dev  libsctp-dev gcc

# install kernel headers
sudo apt-get install -y linux-headers-$(uname -r)

# install clang 7.0 and cmake
sudo apt-get install -y clang-5.0 cmake

# musl
sudo apt-get install -y musl-tools


# setup rust
curl https://sh.rustup.rs -sSf | sh  # Install rustup

source $HOME/.cargo/env

#rustup install nightly
#rustup default nightly

rustup install nightly
rustup default nightly

# git repo
mkdir -p ~/dev && cd ~/dev && git clone https://github.com/jethrosun/NetBricks.git -b dev netbricks
