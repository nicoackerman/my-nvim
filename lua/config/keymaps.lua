-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ========================
-- Clipboard / Undo / LSP
-- ========================

-- Undo and redo
vim.keymap.set("n", "<C-z>", "u", { noremap = true, silent = true })       -- Ctrl+z = undo
vim.keymap.set("n", "<C-S-z>", "<C-r>", { noremap = true, silent = true }) -- Ctrl+Shift+z = redo

-- Hover documentation from LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover info" })

-- Copy the entire file to the system clipboard
vim.keymap.set("n", "<leader>ya", 'ggyG"+y', { desc = "Yank entire file" })

-- ========================
-- Delete / Change / Paste without yanking
-- ========================

vim.keymap.set("n", "x", '"_x')         -- Delete single char without copying it
vim.keymap.set("n", "<Leader>p", '"0p') -- Paste the last yanked text (not last deleted)
vim.keymap.set("n", "<Leader>P", '"0P') -- Same as above but paste before cursor
vim.keymap.set("v", "<Leader>p", '"0p') -- Paste in visual mode from yank register

vim.keymap.set("n", "<Leader>c", '"_c') -- Change text without copying deleted part
vim.keymap.set("n", "<Leader>C", '"_C') -- Change until end of line without copying
vim.keymap.set("v", "<Leader>c", '"_c') -- Change selection without copying
vim.keymap.set("v", "<Leader>C", '"_C') -- Change selection linewise without copying

vim.keymap.set("n", "<Leader>d", '"_d') -- Delete text without copying
vim.keymap.set("n", "<Leader>D", '"_D') -- Delete until end of line without copying
vim.keymap.set("v", "<Leader>d", '"_d') -- Delete selection without copying
vim.keymap.set("v", "<Leader>D", '"_D') -- Delete selection linewise without copying

-- Delete a word backwards
vim.keymap.set("n", "dw", 'vb"_d') -- Select word backwards and delete silently

-- ========================
-- LSP Navigation
-- ========================
-- 🔹 Format the current buffer
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format code" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" }) -- Jump to definition

-- Rename a variable (LSP)
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { noremap = true, silent = true })

-- Show code actions (imports, fixes, etc.)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- ========================
-- Insert mode tweaks
-- ========================

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false }) -- Exit insert mode with "jj"
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false }) -- Exit insert mode with "jk"

-- ========================
-- Buffer / Line editing
-- ========================

-- Mover línea en modo normal
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- Mover bloque en modo visual
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Select all text in buffer
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select entire buffer" })

-- Insert empty line below/above without entering insert mode
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Insert empty line below" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Insert empty line above" })

-- Insert new line (and avoid comment continuation)
vim.keymap.set("n", "<Leader>o", "o<Esc>^Da", { noremap = true, silent = true, desc = "New line below no comments" })
vim.keymap.set("n", "<Leader>O", "O<Esc>^Da", { noremap = true, silent = true, desc = "New line above no comments" })

-- ========================
-- Jumplist / Navigation
-- ========================

vim.keymap.set(
  "n",
  "<C-m>",
  "<C-i>",
  { noremap = true, silent = true, desc = "Make Ctrl-m behave like Ctrl-i (jump forward)" }
)

-- ========================
-- Custom yank actions
-- ========================

vim.keymap.set("n", "<leader>y;", 'y/;<CR>"+y', { desc = "Yank until next semicolon" })
