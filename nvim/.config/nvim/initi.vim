source ~/.vimrc 

" Lsp Diagnostics
"hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red cterm=underline term=underline


" Buffer yank to clipboard
nnoremap <leader>yf :%y+<CR>


" vim fugitive show patches for current file
command! Glog Git log -p --follow -- %

