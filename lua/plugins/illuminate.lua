return {
  -- ============================================================
  -- vim-illuminate — Resalta la palabra bajo el cursor (como VS Code)
  -- ============================================================
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure({
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        delay = 100,
        under_cursor = true,
        large_file_cutoff = 2000,
      })
    end,
  },
}
