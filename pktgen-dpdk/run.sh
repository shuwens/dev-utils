#!/bin/bash

# try 1
#sudo -E app/x86_64-native-linuxapp-gcc/pktgen -c 0x1f -n 3 -- -P -m "[1:3].0, [2:4].1"
# try again
sudo -E app/x86_64-native-linuxapp-gcc/pktgen -l 0-4 -n 3 -- -P -m "[1:3].0, [2:4].1"
