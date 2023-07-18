if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PATH="$HOMEBREW_PREFIX/opt/openjdk/bin:$PATH"
export PATH="$HOME/slack/bin:$PATH"

export EDITOR=nvim
export GIT_EDITOR=nvim

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export TERM=xterm-256color

eval "$(anyenv init -)"
eval "$(thefuck --alias)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

alias ll="exa -ahl --git"
alias nv="nvim"
alias nvi="nvim"

function peco-src() {
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

function peco-select-history() {
  BUFFER=$(history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-select-history
bindkey '^r' peco-select-history

