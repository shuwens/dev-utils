#!/bin/bash
set -e

sudo apt-get update
sudo apt-get install -y build-essential software-properties-common
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get update

# sudo apt-get install -y gcc-6 g++-6
# sudo apt-get install -y gcc-7 g++-7
sudo apt-get install -y gcc-8 g++-8

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-8
gcc -v
