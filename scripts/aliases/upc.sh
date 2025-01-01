#!/bin/bash

echo -e "\n\033[1m==>\033[0m \033[97;44m pacman, aur, and flatpak cache cleanup \033[0m\n"
yay -Sc
pacman -Qtdq | sudo ifne pacman -Rns -
flatpak remove --unused
echo -e "\n\033[97;44m done! \033[0m"
