return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "stylua", -- Lua
      "black", -- Python
      "prettier", -- JS/TS/CSS/HTML
      "clang-format", -- C/C++
      "shellharden", -- bash
      "mypy",
    },
  },
}
