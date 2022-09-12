#!/usr/bin/env zsh

setup_prezto () {
  ZDOTDIR=$HOME/.zsh
  PREZTO_DIR=$ZDOTDIR/.zprezto

  rm -rf $ZDOTDIR
  git clone --recursive https://github.com/sorin-ionescu/prezto.git $PREZTO_DIR

  setopt EXTENDED_GLOB
  for rcfile in $PREZTO_DIR/runcoms/^README.md(.N); do
    ln -s "$rcfile" "$ZDOTDIR/.${rcfile:t}"
  done
}

setup_prezto
