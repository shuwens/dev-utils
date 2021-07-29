#!/bin/bash

set -e

sudo apt install fsharp bubblewrap zip libssl1.0-dev nodejs -y

# up-to-date opam
sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)

# opam init
# opam switch create 4.08.0


mkdir -p $HOME/dev
cd $HOME/dev

if [ -e "ioctl" ]; then
  rm -rf ioctl
  rm -rf pkg-config-rs
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


# rust sgx
cd $HOME/dev
git clone https://github.com/jethrosun/rust-sgx -b safebricks-ver
cp $HOME/git/dev-utils/setup-scripts/rs-registry.sh  rust-sgx/sgxs
cp $HOME/git/dev-utils/setup-scripts/rs-registry.sh  rust-sgx/libenclave-tools


mkdir -p $HOME/dev/others
cd $HOME/dev/others
wget https://ftp.gnu.org/gnu/binutils/binutils-2.26.1.tar.gz
sudo apt install bison -y

# 4.4 kernel
if [ -e "linux-headers-4.4.267-0404267-generic_4.4.267-0404267.202104160747_amd64.deb" ]; then
  echo "Looks like kernel 4.4 is already downloaded and installed, passing.."
else
  wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v4.4.267/amd64/linux-headers-4.4.267-0404267-generic_4.4.267-0404267.202104160747_amd64.deb
  wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v4.4.267/amd64/linux-headers-4.4.267-0404267_4.4.267-0404267.202104160747_all.deb
  wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v4.4.267/amd64/linux-image-unsigned-4.4.267-0404267-generic_4.4.267-0404267.202104160747_amd64.deb
  wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v4.4.267/amd64/linux-modules-4.4.267-0404267-generic_4.4.267-0404267.202104160747_amd64.deb
  sudo  dpkg  -i  *.deb
  sudo update-grub
  grep -Ei 'submenu|menuentry ' /boot/grub/grub.cfg | sed -re "s/(.? )'([^']+)'.*/\1 \2/"
fi


# rust version
rustup toolchain install nightly-2017-01-26
rustup default nightly-2017-01-26
rustup override set nightly-2017-01-26

rustup --version
rustc --version
cargo --version
