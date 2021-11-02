#!/usr/bin/env bash
if !  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && [ ! -d 'Vundle' ] ; then
  echo "Vundle clone skipped, directory already exists"
fi
