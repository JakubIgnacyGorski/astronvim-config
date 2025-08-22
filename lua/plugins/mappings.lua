return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },

          -- buffer operations
          ["<Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

          -- load all buffers
          ["<leader>bm"] = { "<cmd>LoadAllFilesForDiagnostics<cr>", desc = "Load all files to buffer" },
        },
      },
    },
  },
}
