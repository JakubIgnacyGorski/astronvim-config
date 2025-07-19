return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "bash", "c", "cpp", "python" },  -- Gramatyki do zainstalowania
      highlight = {
        enable = true,        -- Włącz kolorowanie składni
        additional_vim_regex_highlighting = false, -- Wyłącz stare regexowe highlightowanie
      },
      indent = { enable = true },  -- Automatyczne wcięcia
      incremental_selection = {     -- Zaznaczanie fragmentów kodu
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<S-CR>",
          node_decremental = "<BS>",
        },
      },
    },
  },
}
