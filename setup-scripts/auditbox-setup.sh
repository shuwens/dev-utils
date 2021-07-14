#!/bin/bash

set -e

mkdir -p $HOME/dev

# ioctl 0.3.3
cd $HOME/dev
git clone https://github.com/emberian/ioctl.git
cd ioctl
git checkout 70b01fe3e530ee4a582d7a1c79c4fc22eb903d97

# rust sgx
cd $HOME/dev
git clone https://github.com/fortanix/rust-sgx
cd rust-sgx
git checkout 1575f9e3b4f2d241267c28fda7a0151b59be48cf

# rust version
rustup toolchain install nightly-2017-01-26
rustup default nightly-2017-01-26
rustup override set nightly-2017-01-26

rustup --version
rustc --version
cargo --version
