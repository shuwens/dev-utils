#!/bin/bash

set -e

sudo apt install fsharp bubblewrap zip libssl1.0-dev nodejs scons -y

# up-to-date opam
sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)

# opam init
# opam switch create 4.08.0


mkdir -p $HOME/dev
cd $HOME/dev

rm -rf netbricks
git clone git@github.com:jethrosun/SGX-NetBricks.git   netbricks

if [ -e "ioctl" ]; then
  rm -rf ioctl
  rm -rf pkg-config-rs
  rm -rf rust-sgx
else
  echo "Passing, no Cargo.lock.."
fi

# ioctl 0.3.3
cd $HOME/dev
# git clone https://github.com/emberian/ioctl.git
# cd ioctl
# git checkout 70b01fe3e530ee4a582d7a1c79c4fc22eb903d97
git clone git@github.com:jethrosun/ioctl.git
git checkout safebricks-ver

# pkg-config 0.3.8
cd $HOME/dev
git clone https://github.com/rust-lang/pkg-config-rs.git
cd pkg-config-rs
git checkout 0.3.8


# rust sgx
cd $HOME/dev
# git clone https://github.com/jethrosun/rust-sgx -b safebricks-ver
git clone git@github.com:jethrosun/rust-sgx.git -b safebricks-ver
cp $HOME/git/dev-utils/setup-scripts/rs-registry-ng.sh  rust-sgx/sgxs
cp $HOME/git/dev-utils/setup-scripts/rs-registry-ng.sh  rust-sgx/libenclave-tools
cp $HOME/git/dev-utils/setup-scripts/rs-registry-ng.sh  rust-sgx/sgxs-tools


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


grep -Ei 'submenu|menuentry ' /boot/grub/grub.cfg | sed -re "s/(.? )'([^']+)'.*/\1 \2/"
echo "Advanced options for Ubuntu>"
