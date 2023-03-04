print("Hello from remaps")
--
vim.keymap.set("n", "<C-n>", "<cmd>NERDTreeToggle<CR>")
vim.keymap.set("n", "<leader>nf", "<cmd>NERDTreeFind<CR>")
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", {})
vim.keymap.set("n", "<leader>mt", "<cmd>Git mergetool<cr>", {})
vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<cr>", {})
vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<cr>", {})
vim.keymap.set("n", "<leader>yf", "<cmd>%y+<cr>",{})
