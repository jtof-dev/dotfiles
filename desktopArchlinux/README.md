# archlinux

## tree

### ly

- `/etc/pam.d/ly`

### steam_dev.cfg

- `~/.var/app/com.valvesoftware.Steam/.local/share/Steam/steam_dev.cfg`

### config.ini

- `/etc/ly/config.ini`

## ly

- I edited the [/etc/pam.d/ly](ly) file to make it auto-login to kwallet using the [kwallet-pam-git](https://aur.archlinux.org/packages/kwallet-pam-git) aur package

- I also made some changes to ly's [config.ini](config.ini)

if I want to add custom colors to `ly`:

- first, add `sd-color` to `mkinitcpio.conf`

- I use custom colors using [mkinitcpio-colors](https://github.com/evanpurkhiser/mkinitcpio-colors) by adding colors to [vconsole.conf](vconsole.conf)

  - to add the colors to `initramfs`, I used `sudo mkinitcpio -p linux-zen`

## steam console settings

- `steam_dev.cfg` is a file that stores custom dev console settings that steam uses at launch

- this file is located at `~/.var/app/com.valvesoftware.Steam/.steam/steam/steam_dev.cfg`

- [source](https://www.reddit.com/r/linux_gaming/comments/16e1l4h/slow_steam_downloads_try_this/)

## `packages.sh`

- this script dumps all my explicitly installed programs across all package managers I use, and copies over my current `.zshrc`
