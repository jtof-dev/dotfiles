#!/bin/bash

# copy the dotfiles
cp ~/.zshrc ./".zshrc archlinux"

cp /etc/ly/config.ini ./

cp /etc/mkinitcpio.conf ./

cp /etc/pam.d/ly ./

cp /etc/vconsole.conf ./

cp ~/.config/kitty/kitty.conf ./

# save my explicitly installed packages

pacman -Qe | awk '{print $1}' > "pacman explicit packages.txt"

yay -Qm | awk '{print $1}' > "aur explicit packages.txt"

flatpak list --app --columns=application | tail -n +1 > "flatpak explicit packages.txt"