#!/bin/bash

# install necessary packages
sudo apt -y update
sudo apt -y install apache2 protobuf

# cumulus
mkdir -p ~/dev/
cd ~/dev
git clone git@github.com:jethrosun/dev-utils.git -b cumulus


