print("Hello from remaps")
vim.keymap.set("n", "<leader>gb", vim.cmd(":Git blame"), {})
vim.keymap.set("n", "<leader>mt", vim.cmd(":Git mergetool"), {})
