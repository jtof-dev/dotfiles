#!/bin/bash

echo -e "\n\033[1m==>\033[0m \033[97;44m pacman and aur update \033[0m\n"
yay -Syu

echo -e "\n\033[1m==>\033[0m \033[97;44m flatpak update \033[0m\n"
flatpak update

echo -e "\n\033[1m==>\033[0m \033[97;44m 'tldr' update \033[0m\n"
tldr --update

echo -e "\n\033[1m==>\033[0m \033[97;44m 'locate' update \033[0m\n"
sudo updatedb
echo "Done."

echo -e "\n\033[1m==>\033[0m \033[97;44m post-update hooks \033[0m\n"
bash ~/scripts/spicetifyFlatpakHook/spotifyVersionCheck.sh

echo -e "\n\033[97;44m done! \033[0m"
