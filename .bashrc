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
  export EDITOR=nvim
  ;;

  linux-gnu)
  export EDITOR=vim
  ;;

esac

# bash completions
source /usr/local/Cellar/git/2.22.0_1/etc/bash_completion.d/git-completion.bash 
# source /usr/local/etc/bash_completion.d

# bash autocomplete for SSH
complete -W "$(echo $(grep '^ssh ' $HOME/.bash_history | sort -u | sed 's/^ssh //'))" ssh


#see http://caliban.org/bash/
set -o vi


# set path for go
if hash go 2>/dev/null ; then
    export GOPATH=$HOME
    export PATH="$PATH:$GOPATH/bin"
fi


if [ -e $HOME/bin ]
then
    export PATH="$PATH:$HOME/bin"
fi

if [ -e /usr/local/kubebuilder ]
then
    export PATH="$PATH:/usr/local/kubebuilder/bin"
fi

# fzf
if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
    bind -x '"\C-f": fd'
    bind -x '"\C-p": nv $(fzf)'
fi

# rbenv
eval "$(rbenv init -)"

# heroku
function cloud() {
    eval "$(ion-client shell)"
    cloud "$@"
}
cloud staging > /dev/null 2>&1

# "$(heroku autocomplete:script bash)"

# added by travis gem
[ -f /Users/tholschuh/.travis/travis.sh ] && source /Users/tholschuh/.travis/travis.sh
