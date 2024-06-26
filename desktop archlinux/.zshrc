# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/andya/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(starship init zsh)"

# aliases
alias grep='grep --color=auto'
alias ls='exa -a --icons'
alias lsl='exa -la --icons'
alias lo='locate'
alias cdd='cd ..'
alias cddd='cd .. && cd ..'
alias cdw='cd ~/Work'
alias pacman='sudo pacman'
alias code='codium'
alias mi='micro'
alias smi='sudo micro'
alias sna='sudo nano'

alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
alias docu='docker-compose up'
alias docd='docker-compose down'
alias mlcli='matlab -nodesktop'
alias ocli='octave --no-gui'
alias mvc='mullvad connect'
alias mvd='mullvad disconnect'
alias mvs='mullvad status'

alias up='w3m archlinux.org && echo -e "\nPacman and AUR update\n----------------------\n" && yay -Syu && echo -e "\nFlatpak update\n---------------\n" && flatpak update && echo -e "\nAppImage update" && echo -e "---------------" && am -u && echo "Done!" '
alias qup='echo -e "\nPacman and AUR update\n----------------------\n" && yay -Syu && echo -e "\nFlatpak update\n---------------\n" && flatpak update && echo "\nDone!" && echo -e "\nAppImage update" && echo -e "---------------" && am -u && echo "Done!" '
alias cl='yay -Sc && pacman -Qtdq | sudo ifne pacman -Rns - && echo -e "\nDone!" '
alias vu='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias kr='bash scripts/restart\ kde.sh'

alias ufw='sudo ufw'

# exports
export STARSHIP_CONFIG=~/.config/starship.toml
export PATH=$PATH:/home/andya/.spicetify
export PATH="$PATH:/home/andya/.cargo/bin"
export EDITOR=/sbin/micro

# hypetrigger .bashrc dependancies
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/usr/local/lib

source /usr/share/nvm/init-nvm.sh

# pnpm
export PNPM_HOME="/home/andya/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
