require('plugins')
require('remap')
require('telescopex')
--vim.cmd('set termguicolors')
vim.opt.termguicolors = true
vim.opt.undodir = "~/.vim/nvimundodir" --Undo file version incompatible with vim
vim.opt.signcolumn = 'yes'
vim.cmd("highlight clear SignColumn")


