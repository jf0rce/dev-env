# XXX this file should only contain non-interactive things like umask,
# environmental variables, whereas ~/.bash_profile should contain all
# interactive-type things like aliases, functions, and the fancy PS1

umask 027

export GIT_PS1_SHOWSTASHSTATE="<nonempty>"
export GIT_PS1_SHOWUNTRACKEDFILES="<nonempty>"
export GIT_PS1_SHOWDIRTYSTATE="<nonempty>"
export GIT_PS1_SHOWUPSTREAM="auto"

export PATH=$PATH:/usr/local/mysql/bin:/opt/local/bin
export EDITOR=vim

if [ -d /usr/local/Cellar/go ] ; then
  export GOROOT="/usr/local/Cellar/go/`ls /usr/local/Cellar/go | tail -1`"
fi

#!/bin/bash

export PATH="$HOME/.goenv/bin:$HOME/gopath/bin:$PATH"

eval "$(goenv init -)"
export GOPATH="$HOME/gopath:"
#END NEW

test -s "$HOME/.bashrc.local" && source ~/.bashrc.local

# added by travis gem
[ -f /Users/j.forsythe/.travis/travis.sh ] && source /Users/j.forsythe/.travis/travis.sh
