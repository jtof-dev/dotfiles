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

### spicetify

- spicetify is very nice to have, but an absolute nightmare to install for the first time. for my own ease of use, I am including a copy of the `.config/spicetify` directory

- to set everything up, run some combination of the following:

```
spicetify config inject_css 1
spicetify config replace_colors 1
spicetify config current_theme marketplace

spicetify config custom_apps marketplace
spicetify apply

spicetify config custom_apps betterLibrary
spicetify config custom_apps history-in-sidebar
spicetify config custom_apps stats
spicetify apply
```

- which should, theoretically, work. though, I'm not sure if this will sync over snippets, since I am `gitignore`ing the `Backup` and `Extracted` folders
