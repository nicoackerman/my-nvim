-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "See more" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

-- Insertar línea vacía debajo sin entrar en Insert mode
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Insert empty line below" })

-- Insertar línea vacía encima sin entrar en Insert mode
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Insert empty line above" })

-- Mostrar acciones de código (importar, arreglar, etc.)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action (imports, fixes...)" })

vim.keymap.set("n", "<leader>y;", 'y/;<CR>"+y')

-- Rename a variable
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { noremap = true, silent = true })
