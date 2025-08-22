return {
  "mikavilpas/yazi.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    {
      "<leader>-",
      "", -- pusty string zamiast nil
      desc = "Yazi", -- to będzie nazwa grupy w which-key
    },
    {
      "<leader>-o",
      "<cmd>Yazi<cr>",
      desc = "Open Yazi at current file",
    },
    {
      "<leader>-w",
      "<cmd>Yazi cwd<cr>",
      desc = "Open Yazi at working dir",
    },
    {
      "<leader>-r",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume last Yazi session",
    },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  init = function() vim.g.loaded_netrwPlugin = 1 end,
}
