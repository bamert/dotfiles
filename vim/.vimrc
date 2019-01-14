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
"Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
"Plugin 'itchyny/lightline.vim'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'powerline/powerline-fonts'
"Git gutter 
"let g:airline_powerline_fonts = 1
"let g:airline_theme = 'powerlineish'
"let g:airline#extensions#hunks#enabled=0
"let g:airline#extesions#branch#enabled=1


:set number
syntax on
"read additional colorscheme
Plugin 'flazz/vim-colorschemes'
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
let g:NERDTreeDirArrowExpandable = '*'
let g:NERDTreeDirArrowCollapsible = 'v'
"enables quick (un)commenting of lines
Plugin 'scrooloose/nerdcommenter'

"tagbar (class overview)
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

"Highlighting the current line:
set cursorline

"find cmake dir automaticaly
Plugin 'vhdirk/vim-cmake'

":nnoremap <Leader>c :set cursorline!<CR>
"show .cl file with cpp syntax
autocmd BufNewFile,BufRead *.cl set syntax=c

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

"Don't show tabline numbers
set guitablabel=%N\ %f

" Open new splits on right and below
set splitbelow splitright
" Snippets!
"autocmd FileType tex inoremap <leader>tt \textt{}<Esc>T{i
"autocmd FileType tex inoremap <leader>align \begin{align}\end{align}<Esc>T}i

"Insert Booktabs table 
function! BooktabsHelper(args)
  let output =  system("bthelper", a:args) 
  put=output 
endfunction
"Defines command Bt
command! -nargs=1 Bt :call BooktabsHelper(<q-args>)

