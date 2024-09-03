# mbp macos

## better touch tool

- the `.bttpreset` files are the backups of my btt configurations, and the `btt credentials` file is encrypted, and contains my liscense to activate btt with

## `dotfiles.sh`

- this script dumps all my explicitly installed programs across all package managers I use, and copies over my current `.zshrc`

## package manager

- I use homebrew to install all of my packages, aside from any that either can't or won't get accepted into homebrew's official repository

### from app store (aside from first-party apps)

- [goodnotes](https://apps.apple.com/us/app/goodnotes-6/id1444383602)
- [technicalc](https://apps.apple.com/us/app/technicalc-calculator/id1504965415)
- [xcode](https://apps.apple.com/us/app/xcode/id497799835)

### outside homebrew repos

- [betterbird](https://www.betterbird.eu/downloads/index.php)
- [bettertouchtool](https://folivora.ai/downloads)

## startup manager menu

- I changed the boot partition icon and label in the startup manager menu on initial boot: to replicate:

- disable system integrity protection

  - reboot into recovery mode and run `csrutil disable` in the terminal

- reboot and use this command to change the label:

`sudo bless --folder /System/Volumes/Data --label <name>`

- then create a 128x128 png image of what you want the startup disk to look like, convert to `.icns`, then copy to `/System/Volumes/Preboot/.VolumeIcon.icns`
