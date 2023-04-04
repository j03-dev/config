vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", ",", vim.cmd.noh)
vim.keymap.set("n", "B", ":!/mnt/d/Project/script/rbuild % <CR>")
vim.keymap.set("n", "<C-o>", ":e ~/.config/nvim <CR>")
vim.keymap.set("n", "<leader>t", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>h", vim.cmd.tabprevious)
vim.keymap.set("n", "<leader>l", vim.cmd.tabnext)
-- vim.keymap.set("n", "<leader>f", ":Files <CR>")
