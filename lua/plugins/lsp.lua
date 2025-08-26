return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    -- LSP servers to install
    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            hint = {
              enable = true,
              paramType = true,
              paramName = "Disable",
              arrayIndex = "Disable",
              semicolon = "Disable",
            },
          },
        },
      },
      tsserver = {},
    }

    -- Auto install servers with mason
    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    -- Capabilities (inlay hints / completion support)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if cmp_ok then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    -- Setup each server
    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          settings = servers[server_name] and servers[server_name].settings or {},
        })
      end,
    })

    -- Enable inlay hints if supported (Neovim 0.10+)
    if vim.fn.has("nvim-0.10") == 1 then
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          ---@type vim.lsp.Client | nil
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
          end
        end,
      })
    end

    -- Optional formatter binding
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format buffer" })
  end,
}
