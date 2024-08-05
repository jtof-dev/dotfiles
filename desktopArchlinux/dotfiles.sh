#!/bin/bash

cp ~/.zshrc ./

pacman -Qe | awk '{print $1}' >"pacman explicit packages.txt"

yay -Qm | awk '{print $1}' >"aur explicit packages.txt"

flatpak list --app --columns=application | tail -n +1 >"flatpak explicit packages.txt"

cp ~/scripts/spotifyPipewireVolumeControl.py ../scripts/
