[ -z "$PROFILE_SOURCED" ] \
	&& source "$HOME/.profile" \
	&& echo 'Sourcing profile'

# History
export HISTSIZE=500
export SAVEHIST=500
export HISTFILE=~/.zhistory

# Completion
zstyle :compinstall filename $HOME/.zshrc
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

# Define pretty prompt
PS1="┌┄ %F{green}%m%f • %~"$'\n'"╰> "

# Check if running in a tty, in that case use only ASCII chars
[ -z "$(tty | grep -E 'pts')" ] && PS1="[%m] %~"$'\n'"-> "

# Use vi mode
set -o vi

# General aliases
alias 'ls'='ls --color'
alias 'la'='ls --color -A'
alias 'll'='ls --color -lh'
alias 'lla'='ls --color -lAh'
alias 'p'='doas pacman'
alias 'v'='nvim'
alias 'em'="emacs"
alias 'rs'='rsync -av'
alias 'wb'="$WEB_BROWSER"
# alias 'img'="$IMAGE_VIEWER"
alias 'vid'="$VIDEO_PLAYER"
alias 'pdf'="$DOC_VIEWER"

# Dir aliases
alias 'mu'='cd ~/music'
alias 'doc'='cd ~/docs'
alias 'au'='cd ~/audio'
alias 'dw'='cd ~/downloads'
alias 'pj'='cd ~/projects'
alias 'pi'='cd ~/pics'
alias 'un'='cd ~/uni'
alias 'vd'='cd ~/vids'
alias 'bk'='cd ~/books'

# Git aliases
alias 'gs'='git status'
alias 'ga'='git add --all'
alias 'gc'='git checkout'
alias 'gD'='git diff --cached'
alias 'gC'='git commit'
alias 'gp'='git push'
alias 'gP'='git pull'
alias 'gF'='git fetch'
alias 'gl'='git log --oneline --graph'
alias 'gB'='git branch'

# Define keybindings
bindkey '^[[H'  beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[P'  delete-char
bindkey '^[[4h' clear-screen
bindkey '^[[5~' backward-word
bindkey '^[[6~' forward-word
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# OSC-7 working dir support 
function osc7 {
	local LC_ALL=C
	export LC_ALL

	setopt localoptions extendedglob
	input=( ${(s::)PWD} )
	uri=${(j::)input/(#b)([^A-Za-z0-9_.\!~*\'\(\)-\/])/%${(l:2::0:)$(([##16]#match))}}
	print -n "\e]7;file://${HOSTNAME}${uri}\e\\"
}

autoload -Uz add-zsh-hook
add-zsh-hook -Uz chpwd osc7

# Just for Foot terminal
tput clear

