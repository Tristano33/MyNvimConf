return {
  -- ============================================================
  -- alpha-nvim — Pantalla de inicio tipo VS Code (welcome / get started)
  -- ============================================================
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
    },
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.theta")

      -- Header personalizado
      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }

      -- Botones de acción tipo VS Code
      dashboard.section.buttons.val = {
        dashboard.button("f", "    Buscar archivo", ":Telescope find_files<CR>"),
        dashboard.button("r", "    Archivos recientes", ":Telescope oldfiles<CR>"),
        dashboard.button("g", "  󰊢  Buscar texto en proyecto", ":Telescope live_grep<CR>"),
        dashboard.button("e", "    Nuevo archivo", ":ene <BAR> startinsert<CR>"),
        dashboard.button("s", "    Configuración", ":e $MYVIMRC<CR>"),
        dashboard.button("q", "  󰗼  Salir", ":qa<CR>"),
      }

      -- Footer con info
      dashboard.section.footer.val = "✨ Neovim configurado como VS Code"

      alpha.setup(dashboard.config)

      -- Ocultar statusline en alpha
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "alpha",
        callback = function()
          vim.opt_local.laststatus = 0
        end,
      })
    end,
  },
}
