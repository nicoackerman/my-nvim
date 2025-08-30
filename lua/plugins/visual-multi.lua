return {
  "mg979/vim-visual-multi",
  branch = "master",
  config = function()
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>", -- select next occurrence
      ["Find Subword Under"] = "<C-n>", -- select next subword
      ["Select All"] = "<C-a>", -- ahora Ctrl+a selecciona todas las ocurrencias
      ["Skip"] = "<C-x>", -- skip current occurrence
      ["Remove Region"] = "<C-p>", -- remove occurrence
    }
  end,
}
