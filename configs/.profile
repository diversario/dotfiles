alias WW='cd ~/Projects/'
alias fuckit='git clean -d -x -f; git reset --hard'

function psaxgrepstuff(){
  ps ax | grep -v grep | grep $1
}

alias pg=psaxgrepstuff
alias p='pwd'

function slackbot_says(){
  curl --data "$1" 'https://shutterstock.slack.com/services/hooks/slackbot?token=$SLACK_AUTH_TOKEN&channel=%23'$2
}

alias slackbot=slackbot_says

PATH=$PATH:$HOME/bin:$HOME/.rvm/bin

if [[ `echo $0` =~ 'zsh' ]]; then
  setopt interactivecomments
  setopt NO_NOMATCH
fi

# If not running interactively, do not do anything
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

# Setting for the new UTF-8 terminal support in Lion
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

# from https://github.com/brianphillips/dotfiles/blob/master/environment.sh
export EDITOR='vim'
export PATH="$HOME/bin:$HOME/opt/bin:/opt/git/bin:$PATH"
export LANG=en_US.UTF-8
export TERM=xterm-256color

# Predictable SSH authentication socket location.
SOCK="$HOME/.ssh/ssh-auth-sock"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f $SOCK
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi
