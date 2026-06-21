return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "slant", -- Estilo elegante inclinado para las pestañas
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
        }
      })

      -- Atajos rápidos para navegar pestañas con Shift + Flechas
      vim.keymap.set("n", "<S-Right>", "<cmd>BufferLineCycleNext<CR>", { desc = "Siguiente pestaña" })
      vim.keymap.set("n", "<S-Left>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Pestaña anterior" })
      
      -- Cerrar buffer con Espacio + b + d (Buffer Delete)
      vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Cerrar buffer actual" })
    end,
  }
}