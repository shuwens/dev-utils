#!/bin/bash

# install necessary packages
sudo apt -y update
sudo apt -y install apache2 automake

# setup protobuf
sudo apt -y update
sudo apt -y install snapd
sudo snap install protobuf --classic

# cumulus
mkdir -p ~/dev/
cd ~/dev
git clone https://github.com/ravinet/mahimahi.git -b cumulus


