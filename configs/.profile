alias fuckit='git clean -d -x -f; git reset --hard'
alias tf=terraform

function psaxgrepstuff(){
  ps ax | grep -v grep | grep $1
}

alias pg=psaxgrepstuff

PATH=$PATH:$HOME/bin

# Setting for the new UTF-8 terminal support in Lion
LC_CTYPE=en_US.UTF-8
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

#export GOPATH=$HOME/Projects/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export LESS=' -R '
export EDITOR='vim'

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


export PATH="$HOME/.cargo/bin:$PATH"

function curltime() {
curl -w @- -o /dev/null -s "$@" <<'EOF'
    time_namelookup:  %{time_namelookup}\n
       time_connect:  %{time_connect}\n
    time_appconnect:  %{time_appconnect}\n
   time_pretransfer:  %{time_pretransfer}\n
      time_redirect:  %{time_redirect}\n
 time_starttransfer:  %{time_starttransfer}\n
                    ----------\n
         time_total:  %{time_total}\n
EOF
}

function iIp() {
  local instanceId=i-$(echo $1 | sed 's/i-//')

  aws ec2 describe-instances --instance-ids $instanceId --query 'Reservations[0].Instances[0].NetworkInterfaces[0].PrivateIpAddress' | tr -d '"'
}

export PATH="$HOME/.asdf/installs/poetry/1.0.0/bin:$PATH"
