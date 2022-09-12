#!/usr/bin/env bash

setup_dotfiles () {
  DOTFILES_ROOT=$(cd $(dirname $0); pwd)

  dotfiles=$(find $DOTFILES_ROOT/home -type f)
  dotfile_dirs=("/" "/.zsh/" "/.config/" "/.config/nvim/")

  mkdir -p "$HOME/.config/nvim"

  for dotfile in $dotfiles; do
    filename=$(basename $dotfile)
    filepath=$(dirname $dotfile)"/"

    for dotfile_dir in "${dotfile_dirs[@]}"; do
      symlink_source_dir=$DOTFILES_ROOT"/home"$dotfile_dir
      if [ "$filepath" = "$symlink_source_dir" ]; then
        symlink=$HOME$dotfile_dir$filename
        symlink_source=$symlink_source_dir$filename
        rm -f "$symlink"
        echo "$symlink <= $symlink_source"
        ln -sf "$symlink_source" "$symlink"
      fi
    done
  done
}

setup_dotfiles
