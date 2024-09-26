#!/bin/python

import os
import subprocess


def main():
    commands = [
        "cp -rv ~/.config/nvim ./crossPlatform/",
        "cp -rv ~/.config/fastfetch ./crossPlatform/",
        "cp -rv ~/.config/zellij ./crossPlatform/",
        "cp -v ~/.config/spicetify/CustomApps/customAppsUpdate.sh ./spicetify/CustomApps/",
        "cp -v ~/.config/kitty/kitty.conf ./crossPlatform/",
        "cp -v ~/.config/starship.toml ./crossPlatform/",
        "cp -v ~/.tmux.conf ./crossPlatform/",
        "sudo cp -rv ~/.config/yazi ./crossPlatform/",
        "cp -v ~/git-repos/gitReposUpdate.py ./scripts/",
        "cp -rv ~/.config/aerc ./crossPlatform/",
        "cp -rv ~/.config/spotify-player ./crossPlatform/",
    ]
    for command in commands:
        runCommand(command)

    dotfilesOs = getOs()
    print(f"Desktop Environment: {dotfilesOs}")

    match dotfilesOs:
        case "desktopArchlinux":
            command = "cd ~/gitRepos/dotfiles/desktopArchlinux && ./dotfiles.sh"
            runCommand(command)
        case "mbpMacos":
            command = "cd ~/gitRepos/dotfiles/mbpMacos && ./dotfiles.sh"
            runCommand(command)
        case "mbpArchlinux":
            command = "cd ~/gitRepos/dotfiles/mbpArchlinux && ./dotfiles.sh"
            runCommand(command)
        case "unknown":
            print("environmental variable not found. is it set?")
            exit()


def runCommand(command):
    result = subprocess.run(command, shell=True, text=True, capture_output=True)
    # print(result.stdout)
    print(f"{command}\n")
    if result.returncode != 0:
        print(result.stderr)


def getOs():
    osCheck = os.getenv("DOTFILES_OS_CHECK")

    if osCheck:
        return osCheck
    else:
        return "unknown"


if __name__ == "__main__":
    main()
