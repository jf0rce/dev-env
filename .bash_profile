source ~/.bashrc

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

TABNAME=""
function ntab {
  if [[ -z $1 ]]
  then
    if [[ -z $TABNAME ]]
    then
      echo -ne "\033]0;"${PWD##*/}"\007"
    fi
  else
    TABNAME=$1
    echo -ne "\033]0;"$TABNAME"\007"
  fi
}

function rsntab {
  TABNAME=""
}

BREW_PREFIX=`brew --prefix`

alias be='bundle exec'
alias ls='ls -alhG'
alias ps='ps auxww'
alias vim='/usr/local/Cellar/macvim/7.4-73_1/MacVim.app/Contents/MacOS/Vim'
export PATH="$BREW_PREFIX/bin:$BREW_PREFIX/sbin:$PATH"  # used by homebrew, plus it's sensible enough
export PROMPT_COMMAND=ntab

if [[ -d "$HOME/bin" ]]; then
  export PATH=$HOME/bin:$PATH
fi

if [[ -d "$HOME/.git-utils" ]]; then
  # need to update $PATH prior to sourcing git completion
  export PATH="$PATH:$HOME/.git-utils"
fi

if [[ ${USE_COMPLETION-1} -eq 1 ]]; then
  for completion_file in $(find $HOME/.bash_completion.d/ -type f)
  do
    if [[ ! -x "$completion_file" ]]; then
      source "$completion_file"
    fi
  done
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
  fi
  export PS1="\[\e[32m\][\t]\[\e[0m\] \u \[\e[33m\][\w]\[\e[0m\]\$(__git_ps1 \"(%s)\"):> "
else
  export PS1="\[\e[32m\][\t]\[\e[0m\] \u \[\e[33m\][\w]\[\e[0m\]\$(parse_git_branch):> "
fi

if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"
fi

export PATH="$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"

if [[ -d "$HOME/.rbenv" ]]; then
  export PATH=$PATH:~/.rbenv/bin
  eval "$(rbenv init -)"
  export PATH=$PATH:~/.rbenv/shims
fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
