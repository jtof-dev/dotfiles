
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


# aliases

# filesystem
alias grep='grep --color=auto'
alias ls='eza -a --icons'
alias lsl='eza -la --icons'
alias lo='locate'
alias cdd='cd ..'
alias cddd='cd ../..'
alias cdddd='cd ../../..'
alias zz='z ..'
alias zzz='z ../..'
alias zzzz='z ../../..'
alias rm='trash'
alias fastfetch='fastfetch -c ~/.config/fastfetch/fastfetch.jsonc'
alias ff='fastfetch'
alias ufw='sudo ufw'

# package management
alias up='brew update && brew upgrade && brew cleanup -s'
alias cl='brew cleanup -s'

# text editors
alias co='codium'
alias sco='sudo codium'
alias mi='micro'
alias smi='sudo micro'
alias na='nano'
alias sna='sudo nano'
alias nv='nvim'
alias snv='sudo nvim'
alias svim='sudo vim'

# scripting
alias sz='source ~/.zshrc'

# misc
alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
alias docu='docker-compose up'
alias docd='docker-compose down'
alias mlcli='matlab -nodesktop'
alias ocli='octave --no-gui'
alias mvc='mullvad connect'
alias mvd='mullvad disconnect'
alias mvs='mullvad status'
alias lg='lazygit'

# exports
export PATH=$PATH:/home/andya/.spicetify
export PATH="$PATH:/home/andya/.cargo/bin"
export PATH="/usr/local/cuda-12.4/bin${PATH:+:${PATH}}"
export "LD_LIBRARY_PATH=/usr/local/cuda-12.4/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
export PATH=$PATH:/Applications/MATLAB_R2023b.app/bin
export PNPM_HOME="/Users/andybabcock/Library/pnpm"
export EDITOR=/sbin/nvim
export DYLD_LIBRARY_PATH="(brew --prefix)/lib"

export MOZ_ENABLE_WAYLAND=1
export TERM=xterm-256color
export ZELLIJ_LAYOUT="~/.config/zellij"
export ZELLIJ_AUTO_ATTACH="true"
export _ZO_DATA_DIR="$HOME/.local/share"
export STARSHIP_CONFIG=~/.config/starship.toml
export DOTFILES_OS_CHECK="mbp_macos"

# evals
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# program specific setup

# pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# zellij auto-start
if [[ -z "$ZELLIJ" ]]; then
    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        zellij attach -c
    else
        zellij
    fi

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi