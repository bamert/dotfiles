#!/usr/bin/env bash
# cd to dotfiles dir
cd "$(dirname "${BASH_SOURCE[0]}")"
stow git vim nvim tmux alacritty
