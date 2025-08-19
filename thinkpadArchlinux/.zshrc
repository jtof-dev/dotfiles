HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob 
setopt notify
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history
unsetopt correct_all
unsetopt beep
bindkey -e
zstyle :compinstall filename "/home/andya/.zshrc"
autoload -Uz compinit
compinit


# aliases

## core utils
alias grep="grep --color=auto"
alias ls="exa -a --icons"
alias ll="exa -la --icons"
alias lo="locate"
alias cd="z"
alias cdd="z .."
alias cddd="z ../.."
alias cdddd="z ../../.."
alias zz="z .."
alias zzz="z ../.."
alias zzzz="z ../../.."
alias cat="bat -p"
alias bat="/sbin/bat -p"
alias ct="bat -p"
alias rm="trash"
alias fastfetch="/sbin/fastfetch -c ~/.config/fastfetch/fastfetch.jsonc"
alias ff="fastfetch"
alias ufw="sudo /sbin/ufw"
alias chmod="sudo /sbin/chmod"
alias ch="sudo /sbin/chmod"
alias ch7="sudo /sbin/chmod +777"
alias cl="clear"

## package management
alias pacman="sudo /sbin/pacman"
alias pa="sudo /sbin/pacman"
alias ps="sudo /sbin/pacman -S"
alias pr="sudo /sbin/pacman -R"
alias pq="sudo /sbin/pacman -Q"
alias pqi="sudo /sbin/pacman -Qi"
alias ys="yay -S"
alias yr="yay -R"
alias yq="yay -Q"
alias yqi="yay -Qi"
alias up="bash ~/scripts/aliases/up.sh"
alias upq="bash ~/scripts/aliases/upq.sh"
alias upy="bash ~/scripts/aliases/upy.sh"
alias upc="bash ~/scripts/aliases/upc.sh"

## text editors
alias co="codium"
alias sc="sudo /sbin/codium"
alias ka="kate"
alias sk="sudo /sbin/kate"
alias mi="micro"
alias sm="sudo /sbin/micro"
alias na="nano"
alias sn="sudo /sbin/nano"
alias nv="nvim"
alias sn="sudo /sbin/nvim"
alias sv="sudo /sbin/vim"

## scripting
alias sz="source ~/.zshrc"
alias ul="sudo updatedb"

## misc
# alias docker="sudo /sbin/docker"
# alias docker-compose="sudo /sbin/docker-compose"
alias du="sudo /sbin/docker-compose up"
alias dd="sudo /sbin/docker-compose down"
alias mlc="matlab -nodesktop"
alias oc="octave --no-gui"
alias mc="mullvad connect"
alias md="mullvad disconnect"
alias ms="mullvad status"
# alias spus='bash -c "sleep 5 && python ~/scripts/spotifyPipewireVolumeControl/spotifyPipewireVolumeControlScriptWriter.py" & disown && spotify_player'
alias sp="spotify_player"
alias lg="lazygit"
alias gp="git pull"
alias gs="git status"
alias gr="git reset --hard HEAD"
alias bt="btop"
alias ae="aerc"
alias batterylog="python /opt/batterylog/batterylog.py"
alias ssh="/usr/bin/mullvad-exclude /usr/bin/ssh"

## startup
alias kde="bash ~/scripts/startupPrograms.sh & startplasma-wayland"


# exports

## path
export PATH="$PATH:/home/andya/.spicetify"
export PATH="$PATH:/home/andya/.cargo/bin"
export PATH="$PATH:/usr/local/cuda-12.4/bin"
export PATH="$PATH:/home/andya/gitRepos/spotify-player/target/release"
export PATH="$PATH:/home/andya/scripts/spotifyVolumeControl/dist"

## programs
export MOZ_ENABLE_WAYLAND=1
export LD_LIBRARY_PATH="/usr/local/cuda-12.4/lib64"
export EDITOR="/sbin/nvim"
export ZELLIJ_LAYOUT="~/.config/zellij"
export ZELLIJ_AUTO_ATTACH="true"
export _ZO_DATA_DIR="$HOME/.local/share"
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
export LM_LICENSE_FILE="/home/andya/gitRepos/intelQuartus/intelQuestaLicense.dat"
export QSYS_ROOTDIR="/home/andya/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/24.1/quartus/sopc_builder/bin"
export THEOS="/opt/theos"

## scripting
export DOTFILES_OS_CHECK="thinkpadArchlinux"


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

## yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

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
autoload bashcompinit
bashcompinit
source "/home/andya/.local/share/bash-completion/completions/am"
