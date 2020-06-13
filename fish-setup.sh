#!/bin/bash
sudo apt install fish -y

mkdir -p ~/.config/fish
ln -s $PWD/config.fish ~/.config/fish/config.fish
echo "fish setup finished"
fish

rm ~/.screenrc
ln -s $PWD/.screenrc  ~/.screenrc
echo "screen setup finished"

