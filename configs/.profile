alias WW='cd ~/Documents/Projects/'
alias fuckit='git clean -d -x -f; git reset --hard'

function tssh() {
  tmate show-m | ack -o 'Remote session: .*' | cut -d' ' -f3,4,5 | pbcopy
}

function psaxgrepstuff(){
  ps ax | grep -v grep | grep $1
}

alias pg=psaxgrepstuff
alias p='pwd'
alias rr='rock run'
alias rcb='rock clean && rock build'
alias rt='rock test'
alias rcbt='rcb && rt'

function slackbot_says(){
  curl --data "$1" 'https://shutterstock.slack.com/services/hooks/slackbot?token=$SLACK_AUTH_TOKEN&channel=%23'$2
}

alias slackbot=slackbot_says

PATH=$PATH:$HOME/bin

setopt interactivecomments

# If not running interactively, do not do anything
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

# Setting for the new UTF-8 terminal support in Lion
LC_CTYPE=en_US.UTF-8
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

setopt NO_NOMATCH

export GOPATH=$HOME/Projects/Shutterstock/go
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
export EDITOR='vim'

function prodlogs {
  ssh prodlogs tail -qF /var/log/flume/shutterstock-accounts__w*.w*.std*.log/current
}

function prodlogs_papertrail {
  ssh prodlogs tail -qF /var/log/flume/papertrail__w*/current
}

function prodlogs_nginx {
  ssh prodlogs tail -F /var/log/flume/shutterstock-accounts__nginx.access.log/current
}

function prodlogs_nginx_ssl {
  ssh prodlogs tail -F /var/log/flume/shutterstock-accountssl__nginx.access.log/current
}

function prodlogs_nginx_ssl_error {
  ssh prodlogs tail -F /var/log/flume/shutterstock-accountssl__nginx.error.log/current
}

function qalogs {
  ssh qalogs tail -qF /var/log/flume/shutterstock-accounts__w*.w*.std*.log/current
}

function devlogs {
  ssh devlogs tail -qF /var/log/flume/shutterstock-accounts__w*.w*.std*.log/current
}

function devlogs_papertrail {
  ssh devlogs tail -qF /var/log/flume/papertrail__w*/current
}

function qalogs_papertrail {
  ssh qalogs tail -qF /var/log/flume/papertrail__w*/current
}

function devlogs_nginx {
  ssh devlogs tail -F /var/log/flume/shutterstock-accounts__nginx.access.log/current
}


function minikubify() {
  export DOCKER_TLS_VERIFY="1"
  export DOCKER_HOST="tcp://192.168.64.2:2376"
  export DOCKER_CERT_PATH="/Users/diversario/.minikube/certs"
  export DOCKER_API_VERSION="1.23"
}

function unminikubify() {
  unset DOCKER_TLS_VERIFY
  unset DOCKER_HOST
  unset DOCKER_CERT_PATH
  unset DOCKER_API_VERSION
}
