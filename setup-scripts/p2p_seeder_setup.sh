#!/bin/bash

set -ex

sudo add-apt-repository ppa:transmissionbt/ppa -y
sudo apt-get update -y
sudo apt-get install transmission-cli transmission-common transmission-daemon -y

sudo cp  /var/lib/transmission-daemon/info/settings.json  /var/lib/transmission-daemon/info/settings.json.bak

sudo service transmission-daemon stop
sudo usermod --append -G debian-transmission jethros
sudo service transmission-daemon start



# seeder setup
#
# https://www.cyberciti.biz/faq/howto-create-lage-files-with-dd-command/
# https://superuser.com/questions/470949/how-do-i-create-a-1gb-random-file-in-linux
sudo rm -rf ~/data
mkdir -p ~/data
mkdir -p ~/torrents
cd ~/data

sudo mkdir -p /var/www/public
sudo chown -R www-data:www-data /var/www/public

sudo chown debian-transmission.debian-transmission /home/jethros/data
sudo usermod -aG www-data $USER

for i in {1..10}
do
	echo "Welcome $i times"
	sudo fallocate -l 1G p2p_image_${i}.img
	sudo dd if=/dev/random of=p2p_image_${i}.img bs=1 count=0 seek=1G
	stat p2p_image_${i}.img
	transmission-create -o ~/torrents/p2p_image_${i}.torrent -c "p2p image ${i}" -t http://tracker.openbittorrent.com:80  p2p_image_${i}.img
done

cp ~/torrents/* ~/dev/pvn/utils/workloads/torrent_files

sudo chown debian-transmission.debian-transmission /home/jethros/data

# https://www.cnx-software.com/2012/06/08/how-to-create-and-seed-a-torrent-in-ubuntu-using-transmission-command-line/
