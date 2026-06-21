return {
  -- ============================================================
  -- aerial.nvim — Outline de símbolos (como Ctrl+Shift+O en VS Code)
  -- ============================================================
  {
    "stevearc/aerial.nvim",
    opts = {
      attach_mode = "global",
      backends = { "lsp", "treesitter", "markdown", "man" },
      show_guides = true,
      layout = {
        max_width = { 40, 0.2 },
        min_width = 20,
        default_direction = "prefer_right",
      },
    },
    keys = {
      { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Outline (Aerial)" },
      { "{",         "<cmd>AerialPrev<CR>",     desc = "Símbolo anterior" },
      { "}",         "<cmd>AerialNext<CR>",     desc = "Siguiente símbolo" },
    },
    config = function(_, opts)
      require("aerial").setup(opts)
    end,
  },
}
