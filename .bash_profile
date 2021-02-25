
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s ~/.bashrc ]] && source ~/.bashrc

unalias ls
alias ll='ls -l'
alias la='ls -la'
alias vi='nvim'
alias vim='nvim'

alias insecure="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --allow-running-insecure-content --disable-web-security --user-data-dir=~/ChromeUserData/"
alias dce="docker-compose run --rm"
alias dcr="docker-compose restart"
alias restart_touchbar="pkill 'Touch Bar agent'; killall 'ControlStrip';"

alias gp="kubectl get pods"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

function dc() { docker-compose -f docker-compose.dev.yml run --rm web $@;  }

go () { cd "/vidyard/$1"; echo -ne "\033]0;$1\007"; ./start.user || ./start.u || ./start.dev;  }

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESETCOLOR="\[\e[00m\]"

  export PS1="\n$RED\u $PURPLE@ $GREEN\w $RESETCOLOR$GREENBOLD\$(git branch 2> /dev/null)\n $BLUE[\#] → $RESETCOLOR"
  export PS2=" | → $RESETCOLOR"
}

export PATH="/usr/local/sbin:/user/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
  # . "/usr/local/opt/nvm/nvm.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi
if [ -e /Users/christiansilivestru/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/christiansilivestru/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
