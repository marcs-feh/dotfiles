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
[ -z "$(tty | grep -E 'pts')" ] && PS1="%~ $ "

# Use vi mode
set -o vi

# General aliases
alias 'ls'='ls --color'
alias 'la'='ls --color -A'
alias 'll'='ls --color -lh'
alias 'lla'='ls --color -lAh'
alias 'p'='doas pacman'
alias 'bat'='bat -p --pager=none'
alias 'v'='nvim'
alias 'em'="devour emacs"
alias 'wb'="devour $WEB_BROWSER"
alias 'img'="devour $IMAGE_VIEWER"
alias 'vid'="devour $VIDEO_PLAYER"
alias 'pdf'="devour $DOC_VIEWER"

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
alias 'ga'='git add'
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

