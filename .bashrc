# if not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# enable color prompt (no support is rare)
color_prompt=yes
export term=xterm-256color

alias ack="ack-grep"
alias gn="python2 $home/local/geeknote/geeknote.py"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias ls='ls --color=auto'
alias todo='vi ~/TODO.txt'


PS1="\[\033[01;34m\]\w\[\033[00m\]\[\033[01;00m\]\$(parse_git_branch)\[\033[00m\]\$ "

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="/Users/csilivestru/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export KUBECONFIG=~/.kube/config-chrissilivestru

export GIT_COMPLETION_CHECKOUT_NO_GUESS=1

export EJSON_KEYDIR=/opt/ejson/keys

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

rebasecity() { git fetch origin master && git checkout "$@" && git rebase origin/master && git push origin --force-with-lease "$@"; }

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/christiansilivestru/.kube/config:/Users/christiansilivestru/.kube/config.shopify.cloudplatform
for file in /Users/christiansilivestru/src/github.com/Shopify/cloudplatform/workflow-utils/*.bash; do source ${file}; done
kubectl-short-aliases
