alias ls='ls --color'
alias ll='ls -la --color' 
alias l1='ls -1 --color'
alias l='ls --color'
alias ..='cd ..'
alias ...='cd ../..'
alias pgrep='pgrep -fl'
alias t='tree'
alias jbos='jobs'
alias rkae='rake'
alias emacs='emacs -nw'

source $HOME/.home/local/bin/bashmarks.sh

# bash autocomplete for SSH
complete -W "$(echo $(grep '^ssh ' .bash_history | sort -u | sed 's/^ssh //'))" ssh

export EDITOR=/usr/bin/vim
export OTP_HOME=/opt/erlang

#see http://caliban.org/bash/
set -o vi


