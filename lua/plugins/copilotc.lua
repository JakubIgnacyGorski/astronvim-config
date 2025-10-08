return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
    keys = function()
      local chat = require "CopilotChat"
      return {
        {
          "<leader>m",
          "",
          desc = "Copilot",
        },
        { "<leader>mc", function() chat.toggle() end, desc = "Toggle Copilot Chat" },
        { "<leader>me", function() chat.explain() end, desc = "Explain code" },
        { "<leader>mt", function() chat.tests() end, desc = "Generate tests" },
        { "<leader>mf", function() chat.fix() end, desc = "Suggest fix/refactor for current line" },
        { "<leader>mr", function() chat.refactor() end, mode = "v", desc = "Refactor selected code" },
        {
          "<leader>mb",
          function() chat.ask("Explain this file", { selection = false }) end,
          desc = "Ask about the whole file",
        },
        {
          "<leader>mv",
          function() chat.ask("Explain this selection", { selection = true }) end,
          mode = "v",
          desc = "Ask about the selected code",
        },
      }
    end,
  },
}
