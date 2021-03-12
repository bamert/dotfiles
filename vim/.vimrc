set nocompatible              " be iMproved, required
set t_Co=256
filetype off                  " required <<========== We can turn it on later
set belloff=all

"set rtp+=~/.fzf
set encoding=utf-8
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'ayu-theme/ayu-vim'
Plugin 'junegunn/seoul256.vim'
" <============================================>
" Specify the plugins you want to install here.
" We'll come on that later
" <============================================>
" All of your Plugins must be added before the following line
call vundle#end()            " required
set nofoldenable
" new, added for python
"set cindent
"autocmd FileType python setlocal foldmethod=indent smartindent shiftwidth=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:

Plugin 'tpope/vim-fugitive'

:set number "linenumbers
syntax on
"read additional colorscheme
Plugin 'flazz/vim-colorschemes'
"

"set bg=dark
"colorscheme evening
let g:seoul256_background = 233
let g:seoul256_light_background = 254
colo evening
"colo seoul256-light
let g:tex_no_error=1 "prevents underscores to show as errors in LaTeX

"command! -nargs=0 Godark :set bg=dark | colorscheme evening
command! -nargs=0 Godark :set bg=dark | colorscheme evening
command! -nargs=0 Goseoul :set bg=dark | colorscheme seoul256
command! -nargs=0 Golight :set bg=light | colorscheme seoul256-light

:hi MatchParen ctermbg=yellow guibg=yellow
"tabline background color black
:hi TabLine ctermfg=8 ctermbg=0
:hi TabLineFill term=bold cterm=bold ctermbg=0
:hi TabLineSel ctermfg=248 ctermbg=0
"reduce the delay that happens when leaving insert mode:
set timeoutlen=1000 ttimeoutlen=10

" Automatic Code Formatting
Plugin 'chiel92/vim-autoformat'
let g:formatprg_cs = "astyle --style=google"
noremap <F3> :Autoformat<CR>

" Insert Doxygen Documentation Headers
Plugin 'DoxygenToolkit.vim'

" NerdTree
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" Fixes skipped character on CENTos
let NERDTreeNodeDelimiter = "\t"
"
"enables quick (un)commenting of lines
Plugin 'scrooloose/nerdcommenter'

" Editing settings
"  Highlighting the current line:
set cursorline

"  Indentation on
filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Remap window navigation
" Credit: https://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap ctrl c in visual mode to yank to system clipboard
vnoremap <C-c> "*y

"  For seamless window navigation with tmux
Bundle 'christoomey/vim-tmux-navigator'
"  Disable automatic visual mode on mouse click
set mouse -=a

"  Don't show tabline numbers
set guitablabel=%N\ %f

"  Open new splits on right and below
set splitbelow splitright
"  Include subdirectories in find path
set path+=**
"  Wildcard menu
set wildmenu
"  Netrw settings
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3

"  Custom statusline
set laststatus=2 " always show it
hi User1 ctermfg=7
hi User2 ctermfg=7

set statusline =%1*\ %n\ %*            "buffer number
set statusline +=\%<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%2*\ %{fugitive#statusline()}
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor


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
":map <leader>nn :set nu!<CR>
" turn hybrid line numbers on
":set number relativenumber
":set nu rnu



" Snippets!
"autocmd FileType tex inoremap <leader>tt \textt{}<Esc>T{i
"autocmd FileType tex inoremap <leader>align \begin{align}\end{align}<Esc>T}i

" Insert Booktabs table (needs to be installed)
function! BooktabsHelper(args)
  let output =  system("bthelper", a:args)
  put=output
endfunction
"Defines command Bt
command! -nargs=1 Bt :call BooktabsHelper(<q-args>)
" Deletes trailing white space
command! Tws :%s/\s\+$//e
