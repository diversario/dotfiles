alias WW='cd ~/Documents/Projects/'
alias fuckit='git clean -d -x -f; git reset --hard'

function psaxgrepstuff(){
  ps ax | grep -v grep | grep $1
}

alias pg=psaxgrepstuff

PATH=$PATH:$HOME/bin

# Setting for the new UTF-8 terminal support in Lion
LC_CTYPE=en_US.UTF-8
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

export GOPATH=$HOME/Projects/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export LESS=' -R '
export EDITOR='vim'

function prodlogs {
  ssh prodlogs tail -qF /var/log/flume/shutterstock-accounts__w*.w*.std*.log/current
}

function envvars() {
  local selector=$1; shift
  local files=($@)

  if [[ -z $files ]]; then
    files="${selector}"
    selector=".envVars"
  fi

  local merge_string='.[0]'

  local num_elements=$((${#files[@]}-1))

  if [[ $num_elements -gt 0 ]]; then
	  for i in $(seq $num_elements); do
	  	merge_string="$merge_string * .[$i]"
	  done
  fi

  yq -s "$merge_string" $files | yq -Mrj $selector' as $e | $e | keys | .[] | "-e \(.)=\($e[.]) "'
}
