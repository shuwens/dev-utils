#!/bin/bash

set -ex

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt update
sudo apt install -y docker-ce

sudo usermod -aG docker ${USER}
su - ${USER}

sudo systemctl status docker




