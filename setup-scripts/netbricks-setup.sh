#!/bin/bash

set -e

# update
sudo apt-get update

# to make sure we have everything
sudo apt-get install -y git curl libssl-dev pkg-config #dpdk-igb-uio-dkms

# make my life easy
sudo apt-get install -y ranger bash-completion vim build-essential neovim silversearcher-ag tshark fish

# install ubuntu deps
sudo apt-get install -y libgnutls30 libgnutls-openssl-dev libcurl4-gnutls-dev libnuma-dev libpcap-dev  libsctp-dev gcc

# install kernel headers
sudo apt-get install -y linux-headers-$(uname -r)

# install clang 7.0 and cmake
sudo apt-get install -y clang-5.0 cmake

# musl
sudo apt-get install -y musl-tools numactl gdb

## for transmission: libcurl-dev?
sudo apt install -y libclang-dev libopenssl-dev  libevent-dev

if [ -e $HOME/.cargo/ ]; then
	echo "Passing, Rust already exists.."
else
	# setup rust
	curl https://sh.rustup.rs -sSf | sh  # Install rustup
	rustup default nightly
fi

source $HOME/.cargo/env
rustup install nightly
rustup default nightly

rustup component add rust-src rustfmt
rustup component add clippy rls rust-analysis

cargo install --force cargo-tree cargo-readme
cargo install --force --git https://github.com/kbknapp/cargo-outdated

if [ -e $HOME/dev/netbricks ]; then
	echo "Passing, netbricks exists.."
else
	# git repo
	mkdir -p ~/dev && cd ~/dev && git clone https://github.com/jethrosun/NetBricks.git -b dev netbricks
fi
