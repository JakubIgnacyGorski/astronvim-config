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

          -- buffer operations
          ["<Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
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
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Go to declaration of current symbol",
          },
          gd = {
            function() vim.lsp.buf.definition() end,
            desc = "Go to definition of current symbol",
          },
          ["<Leader>lc"] = {
            function() vim.lsp.buf.references() end,
            desc = "List references (calls to) current symbol",
          },
          ["<Leader>r"] = { desc = "Renames" },
          ["<Leader>rn"] = { function() vim.lsp.buf.rename() end, desc = "Rename symbol" },
        },
      },
    },
  },
}
