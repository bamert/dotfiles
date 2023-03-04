return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
use 'vim-scripts/DoxygenToolkit.vim'
use 'scrooloose/nerdtree'
use 'scrooloose/nerdcommenter' 
use 'christoomey/vim-tmux-navigator'

--use 'morhetz/gruvbox'
--use({ "ellisonleao/gruvbox.nvim", vim.cmd("colorscheme gruvbox")})
use 'tpope/vim-fugitive'
use 'vim-scripts/DoxygenToolkit.vim'
use 'scrooloose/nerdtree'
use 'scrooloose/nerdcommenter' -- quick uncommenting of lines
use 'christoomey/vim-tmux-navigator'
-- nvim specific plugins
use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'
use 'neovim/nvim-lspconfig'
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/vim-vsnip'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-nvim-lsp'
--Plug 'saadparwaiz1/cmp_luasnip'
--Plug 'L3MON4D3/LuaSnip' 
use 'ray-x/lsp_signature.nvim'
use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
}
--
--
--'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
--Plug 'nvim-treesitter/playground'
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
use 'folke/trouble.nvim'
use 'vim-test/vim-test'
use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
    require("rose-pine").setup()
    vim.cmd('colorscheme rose-pine')
    end
    })
end)


