#!/bin/bash

# install necessary packages
sudo apt -y update
sudo apt -y install apache2 automake g++ phantomjs protobuf-compiler pkg-config
sudo apt-get -y install libprotobuf-c-dev libprotobuf-c1 libprotoc-dev
sudo apt-get -y install libopencv-dev python3-opencv libwebp-dev


# setup protobuf
# sudo apt -y update
# sudo apt -y install snapd
# sudo snap install protobuf --classic

# cumulus
mkdir -p ~/dev/
cd ~/dev
git clone https://github.com/ravinet/mahimahi.git -b cumulus


# ./autogen.sh
# ./configure
# make
