#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Aliases
alias grep='grep --color=auto'
alias ls='exa -a --icons'
alias lsl='exa -la --icons'
alias nano='sudo nano'
alias lo='locate'
alias cdd='cd ..'
alias pacman='sudo pacman'

alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
alias doc-com='docker-compose'

alias update!='echo "" && echo "Pacman and AUR update" && echo "----------------------" && echo "" && yay && echo "" && echo "" && echo "Flatpak update" && echo "---------------" && echo "" && flatpak update && echo "" && echo "Done!" '
alias clean!='yay -Sc && pacman -Qtdq | ifne pacman -Rns - && echo "" && echo "Done!" '


# Exports
export STARSHIP_CONFIG=~/.config/starship.toml
export EDITOR=nano
export PATH=$PATH:/home/andya/.spicetify
export PATH="$PATH:/home/andya/.cargo/bin"


# Misc
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"


# Hypetrigger .bashrc dependancies
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/usr/local/lib

