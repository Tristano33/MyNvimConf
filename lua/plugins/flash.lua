return {
  -- ============================================================
  -- flash.nvim — Navegación rápida saltando a cualquier texto visible
  -- ============================================================
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash: saltar a cualquier texto visible",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash: saltar a nodo Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Flash: operador remoto (ej: dr para borrar)",
      },
      {
        "R",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash: búsqueda Treesitter",
      },
    },
  },
}
