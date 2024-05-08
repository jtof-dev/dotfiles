# archlinux

## ly

- I edited the [/etc/pam.d/ly](ly) file to make it auto-login to kwallet using the [kwallet-pam-git](https://aur.archlinux.org/packages/kwallet-pam-git) aur package

- I also made some changes to ly's [config.ini](config.ini)

if I want to add custom colors to `ly`:

- first, add `sd-color` to `mkinitcpio.conf`

- I use custom colors using [mkinitcpio-colors](https://github.com/evanpurkhiser/mkinitcpio-colors) by adding colors to [vconsole.conf](vconsole.conf)

  - to add the colors to `initramfs`, I used `sudo mkinitcpio -p linux-zen`

## `dotfiles.sh`

- this script dumps all my explicitly installed programs across all package managers I use, and copies over my current `.zshrc`