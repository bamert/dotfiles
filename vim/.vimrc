set nocompatible              " be iMproved, required
set t_Co=256
filetype off                  " required <<========== We can turn it on later

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" <============================================>
" Specify the plugins you want to install here.
" We'll come on that later
" <============================================>
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


Plugin 'vim-airline/vim-airline'
let g_airline_powerline_fonts = 1
:set number
syntax on
"read additional colorscheme

colorscheme twilight256
"reduce the delay that happens when leaving insert mode:
set timeoutlen=1000 ttimeoutlen=10
"plugin that does automatic code format
Plugin 'chiel92/vim-autoformat'
"for doxygen headers
Plugin 'DoxygenToolkit.vim'
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
"NERDTree,what else
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
"tagbar (class overview)
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
