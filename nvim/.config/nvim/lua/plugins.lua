return require('packer').startup(function(use)
  -- Packer can manage itself
use 'wbthomason/packer.nvim'
use 'vim-scripts/DoxygenToolkit.vim'
use 'scrooloose/nerdtree'
use 'scrooloose/nerdcommenter' 
use 'christoomey/vim-tmux-navigator'
use 'tpope/vim-fugitive'
-- nvim specific plugins
use "ellisonleao/gruvbox.nvim"
use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'
use 'neovim/nvim-lspconfig'
use 'hrsh7th/nvim-cmp'
use 'github/copilot.vim'
use 'hrsh7th/vim-vsnip'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-nvim-lsp'
use 'ray-x/lsp_signature.nvim'
use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
}
use 'nvim-lua/plenary.nvim'
use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
use 'nvim-telescope/telescope.nvim'
use 'folke/trouble.nvim'
use 'vim-test/vim-test'
use "EdenEast/nightfox.nvim" -- Packer
use 'lewis6991/gitsigns.nvim'
end)
