-- plugins/lsp.lua
return {
  -- mason + mason-lspconfig
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function() require("mason").setup() end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "ruff",
          "pyright",
          "clangd",
          "lua_ls",
          "bashls",
          "jsonls",
        },
        automatic_installation = true,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require "lspconfig"
      vim.lsp.config("ruff", {})
      vim.lsp.config("pyright", {})
      vim.lsp.config("clangd", {})
      vim.lsp.config("lua_ls", {})
      vim.lsp.config("bashls", {})
      vim.lsp.config("jsonls", {})
      vim.lsp.config("rust_analyzer", {
        cmd = { "rust-analyzer" },
        settings = {
          ["rust-analyzer"] = {
            files = {
              excludeDirs = {
                ".direnv",
                ".git",
                "target",
              },
            },
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
          },
        },
      })
    end,
  },
}
