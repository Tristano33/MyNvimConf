return {
  -- ============================================================
  -- neogit.nvim — Interfaz Git tipo VS Code Source Control
  -- ============================================================
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim", -- Diffs visuales como VS Code
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>gs", "<cmd>Neogit<CR>", desc = "Neogit Status" },
      { "<leader>gc", "<cmd>Neogit commit<CR>", desc = "Neogit Commit" },
    },
    config = function()
      require("neogit").setup({
        kind = "tab", -- Abre en pestaña tipo VS Code
        graph_style = "kitty",
        commit_editor = { kind = "floating" },
        integrations = {
          diffview = true,
        },
      })
    end,
  },
}
