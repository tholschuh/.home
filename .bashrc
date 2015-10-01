## default editor
case $OSTYPE in

  darwin*)
  export EDITOR=/usr/bin/vim
  ;;

  linux-gnu)
  export EDITOR=/usr/bin/vim
  ;;

esac

## bash bookmarks
source $HOME/.home/local/bin/bashmarks.sh

## aliases
case $OSTYPE in

  darwin*)
    source $HOME/.home/.bash_aliases

  ;;
esac

source $HOME/.home/git-completion.bash

# bash autocomplete for SSH
complete -W "$(echo $(grep '^ssh ' $HOME/.bash_history | sort -u | sed 's/^ssh //'))" ssh


#see http://caliban.org/bash/
set -o vi


# added by travis gem
[ -f /Users/tilman/.travis/travis.sh ] && source /Users/tilman/.travis/travis.sh

# set path for go
mkdir -p $HOME/dev/go
export GOPATH=$HOME/dev/go

# enable erlang
source $HOME/opt/erlang-17.5/activate
