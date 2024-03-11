# dotfiles

backups of some of my dotfiles with notes for when I forget what I did (which happens pretty often)

## files

- [/etc/ly/config.ini](config.ini)
- [/etc/mkinitcpio.conf](mkinitcpio.conf)
- [/etc/pam.d/ly](ly)
- [/etc/vconsole.conf](vconsole.conf)
- [/home/andya/.config/kitty/kitty.conf](kitty.conf)
- [/home/andya/kitty-gruvbox-theme/gruvbox_dark_hard.conf](gruvbox_dark_hard.conf)

## general config

### kwallet-pam

- I edited the [/etc/pam.d/ly](ly) file to make it auto-login to kwallet

## themes

### cursor

- I use Posy's Cursor pack

- install from [the Github](https://github.com/simtrami/posy-improved-cursor-linux) instead of through the KDE store

### kitty

- uses FiraMono Nerd Font and partial transparency

### ly

- I use [Ly](https://archlinux.org/packages/extra/x86_64/ly/) as my window manager

- first, add `sd-color` to `mkinitcpio.conf`

- I use custom colors using [mkinitcpio-colors](https://github.com/evanpurkhiser/mkinitcpio-colors) by adding colors to `vconsole.conf`

  - to add the colors to `initramfs`, I used `sudo mkinitcpio -p linux-zen`