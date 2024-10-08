#!/bin/bash

cp ~/.zshrc ./

echo -e "\ncp ~/.zshrc ./\n"

pacman -Qe | awk '{print $1}' >"pacman explicit packages.txt"

echo -e "saved all pacman packages to 'pacman explicit packages.txt'\n"

yay -Qm | awk '{print $1}' >"aur explicit packages.txt"

echo -e "saved all aur packages to 'aur explicit packages.txt'\n"

flatpak list --app --columns=application | tail -n +1 >"flatpaks.txt"

echo -e "saved all flatpaks to 'flatpaks.txt'\n"

gnome-extensions list | sed 's/@.*//' >"gnome extensions.txt"

echo -e "saved all gnome extensions to 'gnome extensions.txt'\n"
