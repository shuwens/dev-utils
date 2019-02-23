#!/bin/bash

set -ex

# update
sudo apt-get update

# to make sure we have everything
sudo apt-get install -y git curl

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

# git repo
mkdir -p ~/dev && cd ~/dev && git clone https://github.com/melvinw/pktgen.git
