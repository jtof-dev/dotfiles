import os
import subprocess

commands = [
    "cp -r ~/.config/nvim ./dotfiles/",
    "cp -r ~/.config/fastfetch ./dotfiles/",
    "cp -r ~/.config/zellij ./dotfiles/",
    "mkdir -p ./spicetify/CustomApps && cp ~/.config/spicetify/CustomApps/customapps\\ update.sh ./spicetify/CustomApps/",
    "cp ~/.config/kitty/kitty.conf ./dotfiles/",
    "cp ~/.config/starship.toml ./dotfiles/",
    "cp ~/.tmux.conf ./dotfiles/",
    "sudo cp -r ~/.config/yazi ./dotfiles/",
    "cp ~/git-repos/gitReposUpdate.py ./dotfiles/",
    "cp -r ~/.config/aerc ./dotfiles/",
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
