# mbp t2 archlinux

- I found some old, thorough notes to self that I wrote after successfully installing arch linux on my macbook. since they are still somewhat accurate, there is no reason to delete them, so here they are

## initial install

- Boot into Recovery Mode
	- Completely wipe the disk (can do this from an external linux image if necessary)
	- Reinstall MacOS from cloud
- Boot into fresh MacOS
	- Install XCode
	- resize partition to ~100-150gb
- [Follow the T2Linux guide (duh)](https://wiki.t2linux.org/distributions/arch/installation/)
	- Partitions should be:
		- MacOS (~150gb)
		- Linux (~330gb)
		- Swap (~20gb)
- Installing packages:
```
pacstrap /mnt base base-devel tar wget curl zsync grep git eza nano vim micro zip flatpak zsh tlp tlp-rdw nerd-fonts-meta man-db networkmanager wpa_supplicant htop docker docker-compose firefox kitty ly
```

## first boot

- After booting successfully:
```
pacman -Syu
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
yay -S vscodium-bin vscodium-bin-marketplace ttf-noto-nerd 1password
flatpak install flathub org.libreoffice.LibreOffice
flatpak install flathub com.brave.Browser
flatpak install flathub com.spotify.Client
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.getmailspring.Mailspring
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub com.github.micahflee.torbrowser-launcher
flatpak install flathub org.videolan.VLC
wget https://raw.githubusercontent.com/ivan-hc/AM-application-manager/main/INSTALL && chmod a+x ./INSTALL && sudo ./INSTALL
am -i etcher
am -i slippi
am -i qbittorrent
```

## outdated theming instructions

- [Kitty theme](https://github.com/catppuccin/kitty/tree/main)
- Install universal Candy theme from KDE Theme store
- Replace default cursor with [Posy's Cursor](https://github.com/simtrami/posy-improved-cursor-linux)
- [Mailspring theme](https://github.com/catppuccin/mailspring)
- [Konsole theme](https://github.com/catppuccin/konsole)