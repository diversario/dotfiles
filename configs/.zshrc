export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell-better"

#source /usr/local/share/antigen/antigen.zsh
#antigen bundle lukechilds/zsh-nvm

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git colored-man-pages gitfast history-substring-search z zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin:/bin:$PATH"

if which nodenv &>/dev/null; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi

if which rvm &>/dev/null; then
  PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

# opt/ctrl + arrow key navigation
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

#if [[ -z $JAVA_HOME && -f /usr/libexec/java_home ]]; then
#  export JAVA_HOME=$(/usr/libexec/java_home)
#fi

source ~/.profile

if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

if [[ -f /usr/local/bin/lesspipe.sh ]]; then
  export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1
fi

if [[ ! -z "$GOPATH" ]]; then
  PATH=$PATH:$GOPATH/bin
fi

if [[ -f /usr/local/share/zsh/site-functions/aws_zsh_completer.sh ]]; then
  source /usr/local/share/zsh/site-functions/aws_zsh_completer.sh
fi

export HISTSIZE=1000000
export SAVEHIST=$((HISTSIZE+1000))
export HISTFILESIZE=1000000
export ZSH_HIGHLIGHT_MAXLENGTH=60

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FCNTL_LOCK
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt INTERACTIVE_COMMENTS
setopt NO_NOMATCH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
