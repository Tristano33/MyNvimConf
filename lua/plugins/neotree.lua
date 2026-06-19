return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          width = 35, -- Un poco más ancho para trabajar cómodos
          mappings = {
            ["?"] = "show_help", -- Si presionas '?' te muestra TODOS los comandos en pantalla
          },
        },
        filesystem = {
          filtered_items = {
            visible = true, -- Muestra archivos ocultos/dotfiles
          },
          follow_current_file = {
            enabled = true, -- Enfoca automáticamente el archivo que tienes abierto en el editor
          },
          use_libuv_file_watcher = true, -- Auto-refresca la barra si creas archivos por fuera (ej. con la consola)
        },
      })
    end,
  }
}