-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true}
-- ========================
-- Clipboard / Undo / LSP
-- ========================

-- Undo and redo
keymap.set("n", "<C-z>", "u", opts)       -- Ctrl+z = undo
keymap.set("n", "<C-S-z>", "<C-r>", opts) -- Ctrl+Shift+z = redo

-- Hover documentation from LSP
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover info" })

-- Copy the entire file to the system clipboard
keymap.set("n", "<leader>ya", 'ggyG"+y', { desc = "Yank entire file" })

-- ========================
-- Delete / Change / Paste without yanking
-- ========================

keymap.set("n", "x", '"_x')         -- Delete single char without copying it
keymap.set("n", "<Leader>p", '"0p') -- Paste the last yanked text (not last deleted)
keymap.set("n", "<Leader>P", '"0P') -- Same as above but paste before cursor
keymap.set("v", "<Leader>p", '"0p') -- Paste in visual mode from yank register

keymap.set("n", "<Leader>c", '"_c') -- Change text without copying deleted part
keymap.set("n", "<Leader>C", '"_C') -- Change until end of line without copying
keymap.set("v", "<Leader>c", '"_c') -- Change selection without copying
keymap.set("v", "<Leader>C", '"_C') -- Change selection linewise without copying

keymap.set("n", "<Leader>d", '"_d') -- Delete text without copying
keymap.set("n", "<Leader>D", '"_D') -- Delete until end of line without copying
keymap.set("v", "<Leader>d", '"_d') -- Delete selection without copying
keymap.set("v", "<Leader>D", '"_D') -- Delete selection linewise without copying

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d') -- Select word backwards and delete silently

-- ========================
-- LSP Navigation
-- ========================
-- 🔹 Format the current buffer
keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format code" })

keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" }) -- Jump to definition

-- Rename a variable (LSP)
keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)

-- Show code actions (imports, fixes, etc.)
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- ========================
-- Insert mode tweaks
-- ========================

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false }) -- Exit insert mode with "jj"
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false }) -- Exit insert mode with "jk"

-- ========================
-- Buffer / Line editing
-- ========================

-- Mover línea en modo normal
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- Mover bloque en modo visual
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Select all text in buffer
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select entire buffer" })

-- Insert empty line below/above without entering insert mode
keymap.set("n", "<leader>o", "o<Esc>", { desc = "Insert empty line below" })
keymap.set("n", "<leader>O", "O<Esc>", { desc = "Insert empty line above" })

-- Insert new line (and avoid comment continuation)
keymap.set("n", "<Leader>o", "o<Esc>^Da", { noremap = true, silent = true, desc = "New line below no comments" })
keymap.set("n", "<Leader>O", "O<Esc>^Da", { noremap = true, silent = true, desc = "New line above no comments" })

-- ========================
-- Jumplist / Navigation
-- ========================

keymap.set(
  "n",
  "<C-m>",
  "<C-i>",
  { noremap = true, silent = true, desc = "Make Ctrl-m behave like Ctrl-i (jump forward)" }
)

-- ========================
-- Custom yank actions
-- ========================

keymap.set("n", "<leader>y;", 'y/;<CR>"+y', { desc = "Yank until next semicolon" })
