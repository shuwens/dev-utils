#!/bin/bash

set -e

# Update first
sudo apt-get update

# Necessary tools to make my life easier
sudo apt-get install -y ranger bash-completion vim build-essential neovim silversearcher-ag tshark fish

# Everything we need to make NetBricks work

sudo apt-get install -y git curl libssl-dev pkg-config #dpdk-igb-uio-dkms
# install ubuntu deps
sudo apt-get install -y libgnutls30 libgnutls-openssl-dev libcurl4-gnutls-dev libnuma-dev libpcap-dev  libsctp-dev gcc
# install kernel headers
sudo apt-get install -y linux-headers-$(uname -r)
# install clang 5.0 and cmake
sudo apt-get install -y clang-5.0 cmake

# musl
sudo apt-get install -y musl-tools numactl gdb

## for transmission: libcurl-dev?
sudo apt install -y libssl-dev libevent-dev
sudo apt install -y libclang-dev

if [ -e $HOME/dev/netbricks ]; then
	echo "Passing, netbricks exists.."
else
	# git repo
	mkdir -p ~/dev && cd ~/dev && git clone https://github.com/jethrosun/NetBricks.git -b dev netbricks
fi
