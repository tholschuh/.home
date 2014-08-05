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

# bash autocomplete for SSH
complete -W "$(echo $(grep '^ssh ' $HOME/.bash_history | sort -u | sed 's/^ssh //'))" ssh


#see http://caliban.org/bash/
set -o vi

