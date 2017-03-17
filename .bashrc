## shell prompt
source $HOME/.home/prompt_command.sh

## aliases
case $OSTYPE in

  darwin*)
    source $HOME/.home/.bash_aliases

  ;;
esac

## default editor
case $OSTYPE in

  darwin*)
  export EDITOR=/usr/local/Cellar/vim/7.4.1190/bin/vim
  ;;

  linux-gnu)
  export EDITOR=vim
  ;;

esac

# bash completions
source $HOME/.home/bash_completion/git-completion.bash
source $HOME/.home/bash_completion/kerl

# bash autocomplete for SSH
complete -W "$(echo $(grep '^ssh ' $HOME/.bash_history | sort -u | sed 's/^ssh //'))" ssh


#see http://caliban.org/bash/
set -o vi



# set path for go
mkdir -p $HOME/dev/go
export GOPATH=$HOME/dev/go
export GP=$GOPATH
export PATH="$PATH:$GOPATH/bin"


if [ -e $HOME/bin ]
then
    export PATH="$PATH:$HOME/bin"
fi

# erlang
source $HOME/opt/erlang/19.1/activate
ERL_LIBS="~/src/erlang/cuter:$ERL_LIBS"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# rbenv
eval "$(rbenv init -)"

# heroku
function cloud() {
    eval "$(ion-client shell)"
    cloud "$@"
}
cloud $USER 2&>1 /dev/null

# added by travis gem
[ -f /Users/tholschuh/.travis/travis.sh ] && source /Users/tholschuh/.travis/travis.sh
