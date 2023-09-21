require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules",".git"} } } 
local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>br", builtin.git_branches, {})
vim.keymap.set("n", "<leader>bb", builtin.buffers, {})
vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})--({ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }), {})
vim.keymap.set("n", "<leader>fc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>fb", builtin.git_bcommits, {})
vim.keymap.set("n", "<leader>ft", builtin.treesitter, {})
vim.keymap.set("n", "<leader>lr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, {})

