if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export SUDO_EDITOR="${HOMEBREW_PREFIX}/bin/nvim"
export GIT_EDITOR="${HOMEBREW_PREFIX}/bin/nvim"
export EDITOR="${HOMEBREW_PREFIX}/bin/nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(anyenv init -)"
eval "$(thefuck --alias)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"

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
