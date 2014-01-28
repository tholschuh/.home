case $OSTYPE in 
  darwin*) 
  alias ls='ls -G'
  alias ll='ls -la -G'
  alias l1='ls -1 -G'
  alias l='ls -G'
  vim_path='/usr/local/Cellar/vim/7.4/bin/vim'
  alias vim=$vim_path
  export EDITOR=$vim_path

  ;;
  linux-gnu)
  alias ls='ls --color'
  alias ll='ls -la --color'
  alias l1='ls -1 --color'
  alias l='ls --color'

  export EDITOR=/usr/bin/vim
  ;;
esac

# aliases (prefer functions over aliases)
alias ..='cd ..'
alias ...='cd ../..'
alias pgrep='pgrep -fl'
alias t='tree'
alias jbos='jobs'
alias rkae='rake'
alias emacs='emacs -nw'

function ack {
  case $OSTYPE in
  linux-gnu)
    ack-grep $@
    ;;
  *)
    ack $@
  esac
}

source $HOME/.home/local/bin/bashmarks.sh

# bash autocomplete for SSH
complete -W "$(echo $(grep '^ssh ' $HOME/.bash_history | sort -u | sed 's/^ssh //'))" ssh

export OTP_HOME=/opt/erlang

#see http://caliban.org/bash/
set -o vi


