#!/bin/bash

set -ex

# make my life easy
sudo apt-get install -y ranger bash-completion vim build-essential

# install ubuntu deps
sudo apt-get install -y libgnutls30 libgnutls-openssl-dev libcurl4-gnutls-dev libnuma-dev libpcap-dev  libsctp-dev gcc

# install kernel headers
sudo apt-get install -y linux-headers-$(uname -r)

# install clang 5.0 and cmake
sudo apt-get install -y clang-5.0 cmake

# musl
sudo apt-get install -y musl-tools


# setup rust
curl https://sh.rustup.rs -sSf | sh  # Install rustup
source $HOME/.cargo/env
rustup install nightly-2019-01-02
rustup default nightly-2019-01-02

# git repo
mkdir git && cd git && git clone https://github.com/jethrosun/NetBricks.git -b fix-dpdk netbricks
