# autogenerated zsh settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob notify
unsetopt beep
bindkey -e
zstyle :compinstall filename '/home/andya/.zshrc'
autoload -Uz compinit
compinit


# aliases

## filesystem
alias grep='grep --color=auto'
alias ls='exa -a --icons'
alias lsl='exa -la --icons'
alias lo='locate'
alias cdd='cd ..'
alias cddd='cd ../..'
alias cdddd='cd ../../..'
alias zz='z ..'
alias zzz='z ../..'
alias zzzz='z ../../..'
alias rm='trash'
alias fastfetch='/sbin/fastfetch -c ~/.config/fastfetch/fastfetch.jsonc'
alias ff='fastfetch'
alias ufw='sudo ufw'

## package management
alias pacman='sudo /sbin/pacman'
alias pa='sudo /sbin/pacman'
alias pas='sudo /sbin/pacman -S'
alias par='sudo /sbin/pacman -R'
alias yas='yay -S'
alias yar='yay -R'
alias up='newsboat -r && echo -e "\nPacman and AUR update\n----------------------\n" && yay -Syu && echo -e "\nFlatpak update\n---------------\n" && flatpak update && echo "\nDone!" '
alias qup='echo -e "\nPacman and AUR update\n----------------------\n" && yay -Syu && echo -e "\nFlatpak update\n---------------\n" && flatpak update && echo "\nDone!" '
alias cl='yay -Sc && pacman -Qtdq | sudo ifne pacman -Rns - && echo -e "\nDone!" '

## text editors
alias co='codium'
alias sco='sudo codium'
alias mi='micro'
alias smi='sudo micro'
alias na='nano'
alias sna='sudo nano'
alias nv='nvim'
alias nvt='NVIM_APPNAME=nvimTest nvim'
alias snv='sudo nvim'
alias svim='sudo vim'

## scripting
alias vu='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias kr='kquitapp6 plasmashell && kstart plasmashell'
alias sz='source ~/.zshrc'
alias uplo='sudo updatedb'
alias upsp='python ~/scripts/spotifyPipewireVolumeControl/spotifyPipewireVolumeControlScriptWriter.py'

## misc
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
alias sp='spotify_player'
alias mail='aerc'

## startup
alias kde='startplasma-wayland'


# exports
export PATH=$PATH:/home/andya/.spicetify
export PATH="$PATH:/home/andya/.cargo/bin"
export PATH="/usr/local/cuda-12.4/bin${PATH:+:${PATH}}"
export "LD_LIBRARY_PATH=/usr/local/cuda-12.4/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
export EDITOR=/sbin/nvim

export MOZ_ENABLE_WAYLAND=1
export ZELLIJ_LAYOUT="~/.config/zellij"
export ZELLIJ_AUTO_ATTACH="true"
export _ZO_DATA_DIR="$HOME/.local/share"
export STARSHIP_CONFIG=~/.config/starship.toml
export DOTFILES_OS_CHECK="desktop_archlinux"


# evals
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# program specific setup

## pnpm
export PNPM_HOME="/home/andya/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

## zellij
# if [[ -z "$ZELLIJ" && "$TERM" == "xterm-kitty" ]]; then
#     if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
#         zellij attach -c
#     else
#         zellij
#     fi
#
#     if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
#         exit
#     fi
# fi
#
# function current_dir() {
#     local current_dir=$PWD
#     if [[ $current_dir == $HOME ]]; then
#         current_dir="~"
#     else
#         current_dir=${current_dir##*/}
#     fi
#     
#     echo $current_dir
# }
#
# function change_tab_title() {
#     local title=$1
#     command nohup zellij action rename-tab $title >/dev/null 2>&1
# }
#
# function set_tab_to_working_dir() {
#     local result=$?
#     local title=$(current_dir)
#     # uncomment the following to show the exit code after a failed command
#     # if [[ $result -gt 0 ]]; then
#     #     title="$title [$result]" 
#     # fi
#
#     change_tab_title $title
# }
#
# function set_tab_to_command_line() {
#     local cmdline=$1
#     change_tab_title $cmdline
# }
#
# if [[ -n $ZELLIJ ]]; then
#     add-zsh-hook precmd set_tab_to_working_dir
#     add-zsh-hook preexec set_tab_to_command_line
# fi

## yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
