return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- this is useful for naming menus
          ["<Leader>b"] = { desc = "Buffers" },
          ["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
          ["<Leader>r"] = { desc = "Renames" },
          ["<Leader>rn"] = { function() vim.lsp.buf.rename() end, desc = "Rename symbol" },
        },
      },
    },
  },
}
