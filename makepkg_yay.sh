#!/usr/bin/bash

echo "Making pkg"
cd yay
sudo -u e makepkg -si
cd ..
echo "Done"
