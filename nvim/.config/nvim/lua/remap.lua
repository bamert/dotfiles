vim.keymap.set("n", "<C-n>", "<cmd>NERDTreeToggle<CR>")
vim.keymap.set("n", "<leader>nf", "<cmd>NERDTreeFind<CR>")
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", {})
vim.keymap.set("n", "<leader>mt", "<cmd>Git mergetool<cr>", {})
vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<cr>", {})
vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<cr>", {})
vim.keymap.set("n", "<leader>yf", "<cmd>%y+<cr>",{})
--Remap window navigation
-- Credit: https://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
--spelling
vim.keymap.set("", "<leader>ll", "<cmd>setlocal spell! spelllang=en_us<CR>")

-- other bindings
vim.keymap.set("", "<leader>mm", "<cmd>silent make<cr>")

vim.keymap.set("n", "<leader>dvo", "<cmd>DiffviewOpen master<cr>", {})
vim.keymap.set("n", "<leader>dvc", "<cmd>DiffviewClose<cr>", {})
vim.keymap.set("n", "<leader>dvr", "<cmd>DiffviewRefresh<cr>", {})

vim.keymap.set('n', '<leader>gl', '<cmd>lua require("gitlink").get_git_web_link()<CR>', { noremap = true, silent = true })
