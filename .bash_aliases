
case $OSTYPE in

  darwin*)
  alias ls='ls -G'
  alias ll='ls -la -G'
  alias l1='ls -1 -G'
  alias l='ls -G'
  ;;

  linux-gnu)
  alias ls='ls --color'
  alias ll='ls -la --color'
  alias l1='ls -1 --color'
  alias l='ls --color'
  ;;

esac

# simple aliases (prefer functions over aliases)
alias ..='cd ..'
alias ...='cd ../..'
alias sl='ls'
alias pgrep='pgrep -fl'
alias t='tree'
alias jbos='jobs'
alias rkae='rake'
alias emacs='emacs -nw'
alias h='heroku'
alias hs='heroku sudo'
alias ic='ion-client'
alias nv='nvim'
alias kc='kubectl'
