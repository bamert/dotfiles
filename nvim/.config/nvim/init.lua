vim.g.mapleader = " "
require('plugins')
require('gitlink') -- needs to be before remap
require('remap')
require('lsp')

require("diffview").setup({
    use_icons = false        -- Requires nvim-web-devicons
})



vim.opt.belloff = 'all'
vim.opt.errorbells = false
vim.opt.nu = true
vim.opt.diffopt='vertical'
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.signcolumn = 'yes'
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.cursorline=true
vim.opt.timeoutlen=1000
vim.opt.ttimeoutlen=10

-- open new splits on right and below
vim.opt.splitbelow=true
vim.opt.splitright=true

-- (include subdirs in search path)
vim.opt.path:append("**") 
vim.opt.wildmenu=true

vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeDirArrowExpandable = '+'
vim.g.NERDTreeDirArrowCollapsible = '-'
vim.g.NERDTreeMinimalUI=1

-- minimal buffer statusline [branchname]
vim.opt.laststatus=2
function my_statusline()
    local branch = vim.fn.FugitiveHead()
    if branch and #branch > 0 then
        return '%F %m ['..branch..'] %= %l/%L %v'
    else
        return '%F  %m %= %l/%L %v'
    end
end

vim.cmd[[ set statusline=%!luaeval('my_statusline()') ]]

-- Backups and undoing
vim.opt.undodir = vim.fn.expand("$HOME/.vim/nvimundodir") --Undo file version incompatible with vim
vim.opt.undofile = true
vim.opt.swapfile=false
vim.opt.backup=false

-- Search
vim.opt.incsearch=false
vim.opt.hls=false

-- completion
vim.opt.completeopt="menu,menuone"

-- folds
vim.opt.foldenable=false

-- colorscheme
require("gruvbox").setup({contrast = "hard"})
require('rose-pine').setup({
    variant = 'main',
	dark_variant = 'main',
})

vim.opt.bg = 'dark'
vim.cmd("colorscheme gruvbox")
vim.cmd("highlight clear SignColumn")

-- add filetype for todo and use same highlighting as for md
vim.filetype.add({
    extension = {
        todo = "todo",
    },
})
-- leave vim test window in normal mode (don't quit on keystroke)
--vim.cmd("let g:test#neovim#start_normal = 1") -- If using neovim strategy
--vim.cmd("let g:test#basic#start_normal = 1") -- If using basic strategy
