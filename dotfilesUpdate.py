#!/bin/python

import os
import subprocess

commands = [
    "cp -rv ~/.config/nvim ./dotfiles/",
    "cp -rv ~/.config/fastfetch ./dotfiles/",
    "cp -rv ~/.config/zellij ./dotfiles/",
    "cp -v ~/.config/spicetify/CustomApps/customAppsUpdate.sh ./spicetify/CustomApps/",
    "cp -v ~/.config/kitty/kitty.conf ./dotfiles/",
    "cp -v ~/.config/starship.toml ./dotfiles/",
    "cp -v ~/.tmux.conf ./dotfiles/",
    "sudo cp -rv ~/.config/yazi ./dotfiles/",
    "cp -v ~/git-repos/gitReposUpdate.py ./dotfiles/",
    "cp -rv ~/.config/aerc ./dotfiles/",
    "cp -rv ~/.config/spotify-player ./dotfiles/",
]


def run_command(command):
    result = subprocess.run(command, shell=True, text=True, capture_output=True)
    print(result.stdout)
    if result.returncode != 0:
        print(result.stderr)


def get_os():
    os_check = os.getenv("DOTFILES_OS_CHECK")

    if os_check:
        return os_check
    else:
        return "unknown"


for command in commands:
    run_command(command)

dotfiles_os = get_os()
print(f"Desktop Environment: {dotfiles_os}")

match dotfiles_os:
    case "desktopArchlinux":
        command = "cd ~/git-repos/dotfiles/desktopArchlinux && ./dotfiles.sh"
        run_command(command)
    case "mbpMacos":
        command = "cd ~/git-repos/dotfiles/mbpMacos && ./dotfiles.sh"
        run_command(command)
    # case "mbpArchlinux":
    # call script
    case "unknown":
        print("environmental variable not found. is it set?")
        exit()
