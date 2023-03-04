source ~/.vimrc 

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
" Telescope 
" The following needs ripgrep to be installed
" nnoremap <leader>lg <cmd>Telescope live_grep<cr> 
" Git blame and merge tool
nnoremap <leader>gb <cmd>Git blame<cr>
nnoremap <leader>mt <cmd>Git mergetool<cr>
" We can improve mason lsp config (replace lsp.lua) as follows
" https://github.com/williamboman/mason.nvim/discussions/57#discussioncomment-3129035
lua require("mason").setup()
lua require("mason-lspconfig").setup()
" Lsp Diagnostics
luafile ~/.config/nvim/lsp.lua
hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red cterm=underline term=underline

" Trouble (diagnostics)
lua << EOF
  require("trouble").setup {
    fold_open = "v", -- icon used for open folds
    fold_closed = ">", -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
    icons = false, -- no icons
    signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
    },
    use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
  }
EOF

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>


" yanking copies into system clipboard
set clipboard+=unnamedplus
" Buffer yank to clipboard
nnoremap <leader>yf :%y+<CR>


" vim fugitive show patches for current file
command! Glog Git log -p --follow -- %

