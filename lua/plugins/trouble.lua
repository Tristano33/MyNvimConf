return {
  -- ============================================================
  -- trouble.nvim — Panel de diagnósticos (como Problems de VS Code)
  -- ============================================================
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {
      modes = {
        diagnostics = {
          groups = {
            { "filename", format = "{file_icon} {basename:Title} {directory}" },
          },
        },
      },
      icons = true,
    },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnósticos (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Diagnósticos del buffer" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Símbolos del documento" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<CR>", desc = "Lista de ubicaciones" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", desc = "Lista quickfix" },
    },
  },
}
