#!/bin/bash

set -e

mkdir -p $HOME/dev
cd $HOME/dev

if [ -e "ioctl" ]; then
  rm -rf ioctl
  rm -rf pkg-config-rs
  rm -rf rust-openssl
  rm -rf rust-sgx
else
  echo "Passing, no Cargo.lock.."
fi



# ioctl 0.3.3
cd $HOME/dev
git clone https://github.com/emberian/ioctl.git
cd ioctl
git checkout 70b01fe3e530ee4a582d7a1c79c4fc22eb903d97


# pkg-config 0.3.8
cd $HOME/dev
git clone https://github.com/rust-lang/pkg-config-rs.git
cd pkg-config-rs
git checkout 0.3.8


# get openssl-sys so we can still use pkg-config 0.3.8
cd $HOME/dev
git clone https://github.com/jethrosun/rust-openssl.git -b safebricks-ver


# rust sgx
cd $HOME/dev
git clone https://github.com/jethrosun/rust-sgx -b safebricks-ver
cp $HOME/git/dev-utils/setup-scripts/rs-registry.sh  rust-sgx/sgxs

# rust version
rustup toolchain install nightly-2017-01-26
rustup default nightly-2017-01-26
rustup override set nightly-2017-01-26

rustup --version
rustc --version
cargo --version
