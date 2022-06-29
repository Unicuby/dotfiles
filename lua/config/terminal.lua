-- allows escape to exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- open split terminal with ;t
vim.keymap.set("n", ";t", ":sp term://zsh<CR> <C-w>r 12<C-W>- i")
