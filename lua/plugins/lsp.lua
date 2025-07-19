-- plugins/lsp.lua
return {
  -- mason + mason-lspconfig
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "clangd",
          "lua_ls",
          "bashls",
          "jsonls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({})
      lspconfig.clangd.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.bashls.setup({})
      lspconfig.jsonls.setup({})
    end,
  },
}
