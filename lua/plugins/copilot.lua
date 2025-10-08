return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      keymap = {
        accept = false, -- handled by completion engine
      },
    },
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        refresh = "gr",
        open = "<M-CR>",
      },
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            ai_accept = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept()
                return true
              end
            end,
          },
        },
        mappings = {
          n = {
            ["<leader>ms"] = {
              function() require("copilot.suggestion").toggle_auto_trigger() end,
              desc = "Toggle Copilot suggestion",
            },
          },
          i = {
            -- Next suggestion
            ["<C-\\>"] = {
              function() require("copilot.suggestion").next() end,
              desc = "Next Copilot suggestion",
            },
            -- Previous suggestion
            ["<C-'>"] = {
              function() require("copilot.suggestion").prev() end,
              desc = "Previous Copilot suggestion",
            },
          },
        },
      },
    },
  },
}
