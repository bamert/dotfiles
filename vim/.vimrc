set nocompatible              " be iMproved, required
set t_Co=256
filetype off                  " required <<========== We can turn it on later

set encoding=utf-8
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

"Airline plugin such that it shows the git branch
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/powerline-fonts'
set guifont=Source\ Code\ Pro\ for\ Powerline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:airline#extensions#hunks#enabled=0
let g:airline#extesions#branch#enabled=1

"should let me see git status in airline:
Plugin 'tpope/vim-fugitive'



:set number
syntax on
"read additional colorscheme
Plugin 'flazz/vim-colorschemes'
colorscheme twilight256
"tabline background color black
:hi TabLineFill term=bold cterm=bold ctermbg=0
:hi TabLine ctermfg=Black ctermbg=244
:hi TabLineSel ctermfg=Black ctermbg=214
"reduce the delay that happens when leaving insert mode:
set timeoutlen=1000 ttimeoutlen=10
"plugin that does automatic code format
Plugin 'chiel92/vim-autoformat'
let g:formatprg_cs = "astyle --style=google"
noremap <F3> :Autoformat<CR>

"for doxygen headers
Plugin 'DoxygenToolkit.vim'
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
"NERDTree,what else
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
"enables quick (un)commenting of lines
Plugin 'scrooloose/nerdcommenter'

"tagbar (class overview)
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

"Highlighting the current line:
set cursorline
:hi CursorLine   cterm=NONE ctermbg=234
:hi CursorLineNr term=bold ctermfg=160 
":hi CursorColumn cterm=NONE ctermbg=#172 ctermfg=white guibg=darkred guifg=white
"

"Async jobs
Plugin 'skywind3000/asyncrun.vim'
"find cmake dir automaticaly
Plugin 'vhdirk/vim-cmake'

":nnoremap <Leader>c :set cursorline!<CR>
"show .cl file with cpp syntax
autocmd BufNewFile,BufRead *.cl set syntax=c

"todo list 
Plugin 'aserebryakov/vim-todo-lists'
