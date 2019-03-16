#!/bin/bash

set -ex

# update
sudo apt-get update

# to make sure we have everything
sudo apt-get install -y git curl


# install ubuntu deps
#sudo apt-get install -y libgnutls30 libgnutls-openssl-dev libcurl4-gnutls-dev libnuma-dev  libsctp-dev gcc libprotobuf-c-dev
sudo apt-get install -y libpcap-dev libprotobuf-c-dev libnuma-dev

# install kernel headers
sudo apt-get install -y linux-headers-$(uname -r)

# install clang 7.0 and cmake
sudo apt-get install -y clang-5.0 cmake

# for helping pktgen
sudo apt-get install -y autoconf build-essential

# git repo
mkdir -p ~/dev && cd ~/dev && git clone https://github.com/jethrosun/pktgen.git
