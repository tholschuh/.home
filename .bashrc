## default editor
case $OSTYPE in

  darwin*)
  vim_path='/usr/local/Cellar/vim/7.4/bin/vim'
  alias vim=$vim_path
  export EDITOR=$vim_path
  ;;

  linux-gnu)
  export EDITOR=/usr/bin/vim
  ;;

esac

## bash bookmarks
source $HOME/.home/local/bin/bashmarks.sh

# bash autocomplete for SSH
complete -W "$(echo $(grep '^ssh ' $HOME/.bash_history | sort -u | sed 's/^ssh //'))" ssh

export OTP_HOME=/opt/erlang

#see http://caliban.org/bash/
set -o vi

