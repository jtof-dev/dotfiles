# mbpArchlinux

## change startup disk label and image

- create a 128x128 png of a logo and convert it to `.icns`, then copy it to `/boot/.VolumeIcon.icns`
- rename the label with `sudo bless --folder /boot/EFI/EFI/BOOT --label <name>`

# issues

## wifi

- gnome might have issues with using `iwd` as the backend instead of `wpa_supplicant`
  - instead [downgrade](https://aur.archlinux.org/packages/downgrade) -> `downgrade wpa_supplicant=2.10` and stop using `iwd` as the backend

## trackpad

- potentially fix scrolling with [this stackoverflow post](https://askubuntu.com/questions/1432154/unable-to-set-scrolling-speed-of-touchpad-ubuntu-22-10-wayland)

## suspend

- deep suspend _might_ work with [this workaround](https://wiki.t2linux.org/guides/postinstall/#suspend-workaround)
- to configure it, you probably have to edit a `logind.conf` to configure what happens on lid close / open

## tinydfr

- customize touch bar buttons using the [tinydfr config file](https://github.com/WhatAmISupposedToPutHere/tiny-dfr/blob/master/share/tiny-dfr/config.toml)
- it would be really nice to get an application launcher running on the touchbar, but that seems impossible
  - you can possibly launch applications with `rofi` automatically? which can also handle bringing the application to the top
  - switching back over to `xorg` would probably solve this problem, using tools like `xdgtool` (I think)
