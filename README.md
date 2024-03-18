# dotfiles

backups of some of my dotfiles with notes for when I forget what I did (which happens pretty often)

## notes

### ly

- I edited the [/etc/pam.d/ly](ly) file to make it auto-login to kwallet using the [kwallet-pam-git](https://aur.archlinux.org/packages/kwallet-pam-git) aur package

- I also made some changes to ly's [config.ini](config.ini)

if I want to add custom colors to `ly`:

- first, add `sd-color` to `mkinitcpio.conf`

- I use custom colors using [mkinitcpio-colors](https://github.com/evanpurkhiser/mkinitcpio-colors) by adding colors to [vconsole.conf](vconsole.conf)

  - to add the colors to `initramfs`, I used `sudo mkinitcpio -p linux-zen`

### dotfiles.sh

- the [dotfiles.sh](dotfiles.sh) bash script will copy in the dotfiles tracked by this repo, and dump a list of all my explicitly installed packages

- call it with `bash dotfiles.sh` from the repo root folder