if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PATH="$HOMEBREW_PREFIX/opt/openjdk/bin:$PATH"

export EDITOR=nvim
export GIT_EDITOR=nvim
export JAVA_HOME=$(/usr/libexec/java_home -v 18)

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export TERM=xterm-256color

eval "$(anyenv init -)"
eval "$(thefuck --alias)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"

alias ll="exa -ahl --git"
alias nv="nvim"

