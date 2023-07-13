vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>n", vim.cmd.NERDTreeToggle)
vim.keymap.set("n", ",", vim.cmd.noh)
vim.keymap.set("n", "B", ":!/mnt/d/Project/script/rbuild % <CR>")
vim.keymap.set("n", "<C-o>", ":e ~/.config/nvim <CR>")
vim.keymap.set("n", "<leader>t", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>h", vim.cmd.tabprevious)
vim.keymap.set("n", "<leader>l", vim.cmd.tabnext)


vim.keymap.set("n", "<leader>r", function()
    local selectedWord = vim.fn.expand('<cword>')
    local replace_by = vim.fn.input("replace -> " .. selectedWord .. " by: ")
    local sep = "/"
    return ":%s" .. sep .. selectedWord .. sep .. replace_by .. sep .. "g <CR>"
end, { expr = true })
