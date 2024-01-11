## General
The configs in this repo are arranged such that they can be easily set up as symlinks with [GNU Stow](https://www.gnu.org/software/stow/).
```
git clone https://github.com/bamert/dotfiles.nvim ~/dotfiles
cd ~/dotfiles && stow tmux nvim ...
```

- the tmux config is adapted for the Kitty terminal
- I remap caps lock to esc when tapped and ctrl when pressed together with another key. For this I use [keyd](https://github.com/rvaiya/keyd) on Linux and [karabiner-elements](https://karabiner-elements.pqrs.org/) on macOS.
- The `sxhkd` config disables the middle mouse button paste (gets in the way when scrolling with a trackpoint on Thinkpad)
- I use the [Iosevka](https://github.com/be5invis/Iosevka) font.

## NeoVim Setup
Install [Packer](https://github.com/wbthomason/packer.nvim) to manage neovim packages. 
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
followed by `:PackerSync` in neovim.

The installed plugins include support for:
- Python/Typescript/Cpp Language Server Support (autocompletes, code actions etc)
- vim-test for interactive test runs of test suites or individual tests
- diffview for diff inspection
- fugitive for git 
- Telescope for file navigation
- Treesitter highlighting
- Github Copilot support


## Vim setup
Install `Vundle` to manage vim packages. **NOTE** Wherever available, I use `neovim`. The Vim config isn't actively maintained.
The neovim config is completely `lua` based and does not require the vim configs in order to function.
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
