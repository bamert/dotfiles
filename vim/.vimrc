set nocompatible              
set t_Co=256
filetype off                  
set belloff=all
set noerrorbells

set encoding=utf-8
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"call plug#begin()
call plug#begin('~/.local/shared/vim/plugged')
"Plug 'VundleVim/Vundle.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
"Plugin 'DoxygenToolkit.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter' " quick uncommenting of lines
Plug 'christoomey/vim-tmux-navigator'
call plug#end()           
set nofoldenable
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:

set diffopt+=vertical
set number "linenumbers
" Automatically toggle between line number modes
" https://jeffkreeftmeijer.com/vim-number/
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

syntax on

" Former colorschemes: evening, seoul256
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
set bg=dark
colo gruvbox
" Conceal tildes in empty buffer lines
highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
let g:tex_no_error=1 "prevents underscores to show as errors in LaTeX

"reduce the delay that happens when leaving insert mode:
set timeoutlen=1000 ttimeoutlen=10

" NerdTree
map <C-n> :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeMinimalUI=1  "Hide help

set cursorline

"  Indentation on
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Remap window navigation
" Credit: https://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap ctrl c in visual mode to yank to system clipboard
vnoremap <C-c> "*y

"  Disable automatic visual mode on mouse click
set mouse -=a

"  Don't show tabline numbers
"set guitablabel=%N\ %f

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
"hi User1 ctermfg=7
"hi User2 ctermfg=3

set statusline =%1*\ %n\ %*            "buffer number
set statusline +=\%<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%2*\ %{fugitive#statusline()}
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor

"show .cl file with cpp syntax
autocmd BufNewFile,BufRead *.cl set syntax=c

"Spellcheck settings changes some highlighting, so do it after  colorschemes
hi SpellBad   guisp=red    gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
hi SpellCap   guisp=yellow gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
hi SpellRare  guisp=blue   gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
hi SpellLocal guisp=orange gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
"Toggles spell checking:
:map <leader>ll :setlocal spell! spelllang=en_us<CR>
"Runs a silent make 
:map <leader>mm :silent make<CR>

" Insert Booktabs table (needs to be installed)
function! BooktabsHelper(args)
  let output =  system("bthelper", a:args)
  put=output
endfunction
"Defines command Bt
command! -nargs=1 Bt :call BooktabsHelper(<q-args>)
" Deletes trailing white space
command! Tws :%s/\s\+$//e

function! OpenURLUnderCursor()
    let s:uri = expand('<cWORD>')
    let s:uri = matchstr(s:uri, "[a-z]*:\/\/[^ >,;)'\"]*")
    let s:uri = substitute(s:uri, '#', '\\#', '')
    let g:os = substitute(system('uname'), '\n', '', '')

    if s:uri != ''
        if g:os == "Darwin"
          silent exec "!open '".s:uri."' > /dev/null"
        else
          silent exec "!xdg-open '".s:uri."' > /dev/null"
        endif
        :redraw!
    endif
 endfunction
 nnoremap gx :call OpenURLUnderCursor()<CR>

 " Show visual selection size
set showcmd

" Omnicompletion (without plugin)
set completeopt=menu,menuone

"autocmd FileType python set omnifunc=python3complete#Complete
"
" Omnicompletion (with OmniCPP complete plugin)
"autocmd FileType c,cpp,h,hpp set omnifunc=omni#cpp#complete#Main

"let OmniCpp_ShowPrototypeInAbbr = 1 " show function signature in preview
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

command! CTags !ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extras=+q
command! CTagsPy !ctags -R --sort=yes --languages=python --python-kinds=-iv --fields=+iaS --extras=+q

" Backups and undoing
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set noincsearch
set nohls

" Hide the X at the end of the tabline (see :h setting-tabline)
function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let bufn =  bufname(buflist[winnr - 1])
    if bufn == ""
        let bufn = "[No Name]"
    endif
    return bufn
endfunction

function TabLineWithoutX()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
          let s .= '%#TabLineSel#'
        else
          let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " Make the label for the tab
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    return s
endfunction


":set tabline=%!TabLineWithoutX()
" Not enabled for now, because the modified symbol isn't working yet
