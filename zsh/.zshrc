if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

path=(
  $(brew --prefix)/opt/curl/bin
  $(brew --prefix)/opt/openjdk/bin
  $HOME/slack-cli/bin
  $HOME/go/bin
  $path
)
fpath=(
  ${ASDF_DIR}/completions
  $(brew --prefix)/share/zsh-completions
  $fpath
)

# export PATH="/opt/homebrew/opt/curl/bin:$PATH"
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# export PATH="$HOME/slack-cli/bin:$PATH"
# export PATH="$HOME/go/bin:$PATH"

export EDITOR=nvim
export GIT_EDITOR=nvim

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export TERM=xterm-256color

eval "$(thefuck --alias)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
source "$(brew --prefix asdf)/libexec/asdf.sh"

autoload -Uz compinit bashcompinit
compinit bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

alias ll="eza -ahl --git"
alias nv="nvim"
alias nvi="nvim"
alias beep="afplay /System/Library/Sounds/Ping.aiff"

function peco-src() {
  local repo=$(ghq list | peco --query "$LBUFFER")
  if [ -n "$repo" ]; then
    repo=$(ghq list --full-path --exact $repo)
    BUFFER="cd ${repo}"
    zle accept-line
  fi
  zle clear-screen
}

function peco-select-history() {
  BUFFER=$(history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle reset-prompt
}

zle -N peco-src
zle -N peco-select-history

bindkey '^]' peco-src
bindkey '^r' peco-select-history

