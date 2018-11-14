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
"colorscheme twilight256
colorscheme evening
:hi MatchParen ctermbg=yellow guibg=yellow
"tabline background color black
:hi TabLine ctermfg=8 ctermbg=0
:hi TabLineFill term=bold cterm=bold ctermbg=0
:hi TabLineSel ctermfg=248 ctermbg=0
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
let NERDTreeShowHidden=1
"enables quick (un)commenting of lines
Plugin 'scrooloose/nerdcommenter'

"tagbar (class overview)
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

"Highlighting the current line:
set cursorline
"The following are required for the colorscheme twilight
":hi CursorLine   cterm=NONE ctermbg=234
":hi CursorLineNr term=bold ctermfg=160 
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
"Spellcheck settings changes some highlighting, so do it after  colorschemes
:hi clear SpellBad
:hi clear SpellCap
:hi clear SpellRare
:hi clear SpellLocal
:hi SpellBad cterm=underline
:hi SpellCap cterm=underline
:hi SpellLocal cterm=underline
"Toggles spell checking:
:map <leader>ll :setlocal spell! spelllang=en_us<CR>
"Instructions: ]s,[s forward backward search typos.
"z= opens replacement suggestion list
"" Track the engine.
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"set runtimepath+=~/dotfiles/vim/snippets/
"let g:UltiSnipsSnippetsDir='~/dotfiles/vim/snippets/'
"let g:UltiSnipsSnippetDirectories=["snippets"]
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>".

"Remap window navigation
"Credit: https://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"For seamless window navigation with tmux
Bundle 'christoomey/vim-tmux-navigator'

"Disable automatic visual mode on mouse click
set mouse -=a
