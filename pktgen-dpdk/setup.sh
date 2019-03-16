#!/bin/bash

set -e

ln -s $PWD/run.sh           ~/dev/pktgen-dpdk/run.sh
echo "setup run.sh for pktgen-dpdk/..."

#rm ~/dev/pktgen-dpdk/cfg/default.cfg
#ln -s $PWD/cfg/default.cfg  ~/dev/pktgen-dpdk/cfg/default.cfg
rm ~/dev/pktgen-dpdk/cfg/*
cp -r $PWD/cfg/  ~/dev/pktgen-dpdk/cfg/
echo "use the default cfg in our case..."
