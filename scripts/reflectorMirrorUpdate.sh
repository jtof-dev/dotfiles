#!/bin/bash

sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

sudo reflector --country "US" --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -Syy
