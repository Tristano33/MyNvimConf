return {
  -- ============================================================
  -- zen-mode.nvim — Modo de enfoque tipo Zen Mode de VS Code
  -- ============================================================
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
    },
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
      },
    },
  },

  -- ============================================================
  -- twilight.nvim — Oscurece el código fuera del foco (dependencia de Zen)
  -- ============================================================
  {
    "folke/twilight.nvim",
    opts = {
      context = 15,
      treesitter = true,
      dimming = {
        alpha = 0.25,
        color = { "Normal", "#ffffff" },
        term_bg = "#000000",
      },
    },
  },
}
