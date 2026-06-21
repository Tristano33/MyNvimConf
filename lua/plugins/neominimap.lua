return {
  -- ============================================================
  -- neominimap.nvim — Minimapa estilo VS Code
  -- ============================================================
  {
    "Isrothy/neominimap.nvim",
    version = "v3.*",
    -- NOTA: No usa setup(), se configura con vim.g.neominimap
    lazy = false,
    keys = {
      { "<leader>nm", "<cmd>Neominimap Toggle<CR>", desc = "Toggle Neominimap" },
      { "<leader>nf", "<cmd>Neominimap Focus<CR>", desc = "Focus Neominimap" },
    },
    init = function()
      -- Configuración global del plugin (NO usa opts/ setup)
      vim.g.neominimap = {
        auto_enable = true,
        minimap_width = 20,
        log_level = 4, -- vim.log.levels.ERROR (número, no string)
        exclude_filetypes = { "help", "lazy", "mason", "TelescopePrompt", "neo-tree", "alpha" },
      }

      vim.opt.wrap = false
      vim.opt.sidescrolloff = 36
    end,
  },
}
