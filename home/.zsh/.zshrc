#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ -s "$HOME/.config/up/up.sh" ]]; then
  source "$HOME/.config/up/up.sh"
fi

# Customize to your needs...

export GOPATH="$HOME/.go"
export MANPATH="/usr/local/share/man:/usr/local/man:/usr/share/man"
export EDITOR=nvim
export GIT_EDITOR=nvim
export TERM="xterm-256color"
export ZPLUG_HOME="/usr/local/opt/zplug"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export JAVA_HOME=$(/usr/libexec/java_home -v 15)

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=20000
setopt hist_ignore_dups

export PATH="$PATH:$HOME/.anyenv/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.jenv/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:$HOME/.slackcli/bin"
export PATH="$PATH:$GOPATH/bin"

# z
. /usr/local/etc/profile.d/z.sh
# zplug
# source $ZPLUG_HOME/init.zsh

eval "$(anyenv init -)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(thefuck --alias)"
eval "$(jenv init -)"

alias ll='eza -ahl --git'
alias v='vim'
alias n='nvim'
alias nv='nvim'
alias nvi='nvim'

# ghq peco search
function peco-src () {
    local repo=$(ghq list | peco --query "$LBUFFER")
    if [ -n "$repo" ]; then
        repo=$(ghq list --full-path --exact $repo)
        BUFFER="cd ${repo}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

function peco-select-history {
    BUFFER=`history -n -r 1 | peco --query "$LBUFFER"`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# fuzzy finder
function fd-fzf() {
  local target_dir=$(fd -t d -I -H -E ".git"| fzf-tmux --reverse --query="$LBUFFER")
  local current_dir=$(pwd)

  if [ -n "$target_dir" ]; then
    BUFFER="cd ${current_dir}/${target_dir}"
    zle accept-line
  fi

  zle reset-prompt
}
zle -N fd-fzf
bindkey "^n" fd-fzf

