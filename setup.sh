git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#Setup VIM
echo "source ~/dotfiles/vim/.vimrc" > ~/.vimrc 
#Setup Tmux
echo "source ~/dotfiles/tmux/.tmux.conf" > ~/.tmux.conf
#Setup Git
echo "[include]\n" > ~/.gitconfig
echo "  path = ~/dotfiles/git/.gitconfig" >> ~/.gitconfig
