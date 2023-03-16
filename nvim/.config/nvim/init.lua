require('plugins')
require('remap')
require('telescopex')
require('lsp')
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
vim.opt.path:append("**") --set path+=** (include subdirs in search path)
vim.opt.wildmenu=true
-- No tilde in empty lines
-- highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
-- The following only works for normal buffers in neovim, but not in nerdtree
vim.wo.fillchars='eob: '

vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeDirArrowExpandable = '+'
vim.g.NERDTreeDirArrowCollapsible = '-'
vim.g.NERDTreeMinimalUI=1

-- statusline
vim.opt.laststatus=2
--vim.opt.statusline = "%1*\ %n\ %*"
function my_statusline()
    local branch = vim.fn.FugitiveHead()
    if branch and #branch > 0 then
        return '%F ['..branch..'] %= %l/%L %v'
    else
        return '%F  %= %l/%L %v'
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
vim.opt.bg = 'dark'
vim.cmd("colorscheme gruvbox")
--- @usage 'auto'|'main'|'moon'|'dawn'
--  variant = 'auto',
--      --- @usage 'main'|'moon'|'dawn'
--          dark_variant = 'main',
-- I think the following doesnt work yet
vim.cmd("highlight clear SignColumn")



