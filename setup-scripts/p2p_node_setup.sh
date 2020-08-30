#!/bin/bash

set -ex

sudo add-apt-repository ppa:transmissionbt/ppa
sudo apt-get update -y
sudo apt-get install transmission-cli transmission-common transmission-daemon -y

sudo cp  /var/lib/transmission-daemon/info/settings.json  /var/lib/transmission-daemon/info/settings.json.bak

mkdir ~/torrents
scp jethros@10.200.111.125:/var/www/public/* ~/torrents
