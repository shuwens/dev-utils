#!/bin/bash

set -ex

sudo add-apt-repository ppa:transmissionbt/ppa
sudo apt-get update -y
sudo apt-get install transmission-cli transmission-common transmission-daemon -y

sudo cp  /var/lib/transmission-daemon/info/settings.json  /var/lib/transmission-daemon/info/settings.json.bak


# seeder setup
#
# https://www.cyberciti.biz/faq/howto-create-lage-files-with-dd-command/
# https://superuser.com/questions/470949/how-do-i-create-a-1gb-random-file-in-linux
mkdir -p ~/data
cd ~/data

for i in {1..5}
do
	echo "Welcome $i times"
	fallocate -l 1G p2p_image_${i}.img
	dd if=/dev/random of=p2p_image_${i}.img bs=1 count=0 seek=1G
	stat p2p_image_${i}.img
done
