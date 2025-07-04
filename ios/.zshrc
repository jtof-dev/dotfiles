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
alias ct="bat -p"
alias cl="clear"
alias nv="nvim"
alias sz="source ~/.zshrc"
alias ul="sudo updatedb"
alias gp="git pull"
alias ff="neofetch"

export PS1="%B%~%b %F{blue}->%f "

eval "$(zoxide init zsh)"
