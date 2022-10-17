

## history
# Set no limit for history file size
HISTFILESIZE=-1
# # Do not store a duplicate of the last entered command
HISTCONTROL=ignoredups
# Configure BASH to append (rather than overwrite the history):
shopt -s histappend
# Attempt to save all lines of a multiple-line command in the same entry
shopt -s cmdhist


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
BASH_COMPLETION=/usr/local/etc/bash_completion.d
if [ -d "$BASH_COMPLETION" ];
then
    source "$BASH_COMPLETION/bash"
    source "$BASH_COMPLETION/git-completion.bash"
fi
export CDPATH="$CDPATH:~/src/github.com/heroku:~/src:~:"
complete -d cd

#see http://caliban.org/bash/
set -o vi

# set path for go
if hash go 2>/dev/null ; then
    export GOPATH=$HOME
    export PATH="$PATH:$GOPATH/bin"
fi

if [ -e $HOME/.cargo/bin ]
then
    export PATH="$PATH:$HOME/.cargo/bin"
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

if hash ion-client 2>/dev/null ; then
    cloud staging > /dev/null 2>&1
fi

# "$(heroku autocomplete:script bash)"
# complete -F _heroku h

## shell prompt
# After each command, append to the history file and reread it
export PROMPT_COMMAND="history -a; history -c; history -r; source $HOME/.home/prompt_command.sh"
# PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$"\n"}history -a; history -c; history -r; "

