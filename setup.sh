if !  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && [ ! -d 'Vundle' ] ; then
  echo "Vundle clone skipped, directory already exists"
fi
if ! git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && [  ! -d 'tmp' ] ; then
  echo "tpm clone skipped, directory already exists"
fi

#Setup VIM
echo "source ~/dotfiles/vim/.vimrc" > ~/.vimrc 
#Setup Tmux
echo "source ~/dotfiles/tmux/.tmux.conf" > ~/.tmux.conf
#Setup Git
echo "[include]\n" > ~/.gitconfig
echo "  path = ~/dotfiles/git/.gitconfig" >> ~/.gitconfig
