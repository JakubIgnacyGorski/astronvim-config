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
      vim.lsp.config("ruff", {})
      vim.lsp.config("pyright", {})
      vim.lsp.config("clangd", {})
      vim.lsp.config("lua_ls", {})
      vim.lsp.config("bashls", {})
      vim.lsp.config("jsonls", {})
      vim.lsp.config.rust_analyzer = {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_markers = { "Cargo.toml", ".git" },
        single_file_support = true,
        settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              enable = false,
            },
          },
        },
        before_init = function(init_params, config)
          -- See https://github.com/rust-lang/rust-analyzer/blob/eb5da56d839ae0a9e9f50774fa3eb78eb0964550/docs/dev/lsp-extensions.md?plain=1#L26
          if config.settings and config.settings["rust-analyzer"] then
            init_params.initializationOptions = config.settings["rust-analyzer"]
          end
        end,
      }
      vim.lsp.enable "rust_analyzer"
    end,
  },
}
