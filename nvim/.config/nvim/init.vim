set termguicolors
source ~/.vimrc 
set undodir=~/.vim/nvimundodir "Undo file version incompatible with vim
set signcolumn=yes
highlight clear SignColumn

call plug#begin('~/.local/shared/nvim/plugged')
" Repeat plugins for vim
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter' " quick uncommenting of lines
Plug 'christoomey/vim-tmux-navigator'
" nvim specific plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip' 
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/trouble.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'vim-test/vim-test'
call plug#end()
" Treesiter highlighting
lua require'nvim-treesitter.configs'.setup {highlight = { enable = true }}
" Telescope 
lua require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules",".git"} } } 
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>br <cmd>Telescope git_branches<cr>
" The following needs ripgrep to be installed
" nnoremap <leader>lg <cmd>Telescope live_grep<cr> 
nnoremap <leader>lg <cmd>lua require('telescope.builtin').live_grep{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>
nnoremap <leader>fb <cmd>Telescope git_bcommits<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>

" Lsp Diagnostics
luafile ~/.config/nvim/lsp.lua
hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red

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

" Setup harpoon with telescope
lua require("telescope").load_extension('harpoon')
nnoremap <leader>ha <cmd> lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>hr <cmd> lua require("harpoon.mark").rm_file()<cr>
nnoremap <leader>hv :lua require("harpoon.mark").to_quickfix_list() <cr> :copen <cr> 
nnoremap <leader>hq <cmd> lua require("harpoon.ui").toggle_quick_menu()<cr>

" yanking copies into system clipboard
set clipboard+=unnamedplus
" Buffer yank to clipboard
nnoremap <leader>yf :%y+<CR>


" vim fugitive show patches for current file
command! Glog Git log -p --follow -- %
