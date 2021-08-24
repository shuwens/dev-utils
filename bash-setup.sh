#!/bin/bash

mv ~/.bashrc ~/.bashrc.bak
ln -s $PWD/bashrc ~/.bashrc
echo "bash setup finished"

rm ~/.screenrc
ln -s $PWD/.screenrc  ~/.screenrc
echo "screen setup finished"
