source ~/.vimrc 
set undodir=~/.vim/nvimundodir "Undo file version incompatible with vim
set signcolumn=yes
highlight clear SignColumn

"For NVIM LSP
call plug#begin('~/.local/shared/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip' 
Plug 'ray-x/lsp_signature.nvim'
call plug#end()

luafile ~/.config/nvim/lsp.lua
hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red

