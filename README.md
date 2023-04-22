# Installation
Install using [GNU Stow](https://www.gnu.org/software/stow/):
```
stow git tmux nvim kitty ...
```

# Setup Nvim
My neovim configs are lua based. Install `packer` to manager neovim packages [Github](https://github.com/wbthomason/packer.nvim). 
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
followed by `:PackerSync` in neovim.

# Setup vim
install `Vundle` for manager vim packages
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
