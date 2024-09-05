# mbpArchlinux

## tree

suspend service

- `/etc/systemd/system/suspend-fix-t2.service`

t2fanrd

- `/etc/t2fand.conf`

## change startup disk label and image

- create a 128x128 png of a logo and convert it to `.icns`, then copy it to `/boot/.VolumeIcon.icns`
- rename the label with `sudo bless --folder /boot/EFI/EFI/BOOT --label <name>`

## wifi

- currently, `wpa_supplicant` is broken for all broadcom wifi chips, so when using `NetworkManager`, you can either use `iwd` as the backend or downgrade to an older version of `wpa_supplicant`

- my experience from using x11 gnome on arch has been that `iwd` is buggy with the gnome gui, whereas downgrading `wpa_supplicant` has worked as intended

  - I used the aur package `downgrade` to downgrade `wpa_supplicant` to `2.10-8`

## trackpad

- as far as I can tell, trackpad scrolling on wayland has no real solution besides dealing with it, so instead I am using xorg and a script to manage my settings

- I use [this script](../scripts/trackpad-userspace.sh) to set the trackpad, though it doesn't persist through restarts

- to fix missing three finger gestures, I installed `touchegg` and grabbed the `x11gestures` extension from the gnome extensions store

## issues

- `tiny-dfr` crashes after waking from suspend with no way to restart

- keyboard backlight crashes after waking from suspend with no way to restart
