vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", ",", vim.cmd.noh)
vim.keymap.set("n", "B", ":!python /mnt/d/script/pybuild.py -f % <CR>")
vim.keymap.set("n", "<C-o>", ":e ~/.config/nvim <CR>")
-- vim.keymap.set("n", "<leader>f", ":Files <CR>")
