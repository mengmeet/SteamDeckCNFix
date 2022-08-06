#!/bin/bash

# This script is enabling (uncommenting) the Japanese locale and regenerates them

sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -S glibc
sudo sed -i "s%#ja_JP.UTF-8 UTF-8%ja_JP.UTF-8 UTF-8%" /etc/locale.gen
sudo locale-gen
sudo steamos-readonly enable
echo "Done! Be sure to put `LANG=ja_JP.UTF-8 %command%` in the game's startup options on Steam to enable the locale."