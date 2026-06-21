return {
  -- ============================================================
  -- 1. gitsigns.nvim — Signos de Git en el gutter
  -- ============================================================
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        current_line_blame = false, -- Se activa con <leader>gb
        preview_config = {
          border = "rounded",
        },
        on_attach = function(bufnr)
          local gs = require("gitsigns")
          local opts = { buffer = bufnr }

          vim.keymap.set("n", "<leader>gb", gs.toggle_line_blame, opts)
          vim.keymap.set("n", "<leader>gd", gs.diffthis, opts)
          vim.keymap.set("n", "<leader>gD", function() gs.diffthis("~") end, opts)
          vim.keymap.set("n", "<leader>gp", gs.preview_hunk, opts)
          vim.keymap.set("n", "<leader>gB", gs.blame, opts)
          vim.keymap.set("n", "<leader>gr", gs.reset_hunk, opts)
          vim.keymap.set("n", "]h", gs.next_hunk, opts)
          vim.keymap.set("n", "[h", gs.prev_hunk, opts)
        end,
      })
    end,
  },

  -- ============================================================
  -- 2. nvim-autopairs — Cierre automático de paréntesis, etc.
  -- ============================================================
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- ============================================================
  -- 3. Comment.nvim — Comentar con gcc, gc, etc.
  -- ============================================================
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- ============================================================
  -- 4. which-key.nvim — Ayuda emergente al presionar <leader>
  -- ============================================================
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({
        preset = "modern",
        icons = {
          mappings = false,
        },
        spec = {
          { "<leader>a",  group = "[A]erial (Outline)" },
          { "<leader>b",  group = "[B]uffer" },
          { "<leader>c",  group = "[C]ode" },
          { "<leader>ca", group = "Code [A]ction" },
          { "<leader>d",  group = "[D]ocument" },
          { "<leader>e",  group = "[E]xplorer" },
          { "<leader>g",  group = "[G]it" },
          { "<leader>gg", group = "[G]it UI (lazygit)" },
          { "<leader>gs", group = "Git [S]tatus" },
          { "<leader>gc", group = "Git [C]ommit" },
          { "<leader>n",  group = "[N]eominimap" },
          { "<leader>r",  group = "[R]ename" },
          { "<leader>s",  group = "[S]earch" },
          { "<leader>w",  group = "[W]indow" },
          { "<leader>wv", group = "[V]ertical split" },
          { "<leader>ws", group = "[S]plit horizontal" },
          { "<leader>wq", group = "[Q]uit window" },
          { "<leader>wo", group = "[O]nly keep this" },
          { "<leader>x",  group = "[X] Trouble / Diagnósticos" },
          { "<leader>z",  group = "[Z]en Mode" },
          { "[",          group = "Prev" },
          { "]",          group = "Next" },
          { "g",          group = "Go to" },
        },
      })
    end,
  },

  -- ============================================================
  -- 5. indent-blankline.nvim — Guías de indentación
  -- ============================================================
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
          tab_char = "│",
          highlight = "IblIndent",
        },
        scope = {
          enabled = true,
          char = "│",
          highlight = "IblScope",
          show_start = true,
          show_end = true,
        },
        exclude = {
          filetypes = {
            "help", "terminal", "dashboard", "neo-tree", "TelescopePrompt",
            "lazy", "mason", "notify", "toggleterm", "NvimTree", "Outline",
          },
        },
      })
    end,
  },

  -- ============================================================
  -- 6. noice.nvim — UI moderna para cmdline, mensajes y notificaciones
  -- ============================================================
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
          opts = {
            border = {
              style = "rounded",
            },
          },
        },
        messages = {
          enabled = true,
          view = "mini",
        },
        popupmenu = {
          enabled = true,
          backend = "nui",
        },
        notify = {
          enabled = true,
          view = "mini",
        },
        lsp = {
          progress = {
            enabled = true,
            view = "mini",
          },
          override = {
            "vim.lsp.util.convert_input_to_markdown",
            "vim.lsp.util.stylize_markdown",
            "vim.lsp.util.stylize_markdown_code_blocks",
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = true,
          lsp_doc_border = true,
        },
      })
    end,
  },

  -- ============================================================
  -- 7. nvim-surround — Manipular rodeadores: ys, cs, ds
  -- ============================================================
  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- ============================================================
  -- 8. todo-comments.nvim — Resaltar TODO, FIXME, HACK, etc.
  -- ============================================================
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>st", "<cmd>TodoTelescope<CR>", desc = "Search todos" },
    },
    config = function()
      require("todo-comments").setup({
        signs = true,
        keywords = {
          FIX = { icon = "🛠" },
          FIXME = { icon = "❗" },
          TODO = { icon = "✅" },
          HACK = { icon = "⚠️" },
          WARN = { icon = "⚠️" },
          NOTE = { icon = "📝" },
          PERF = { icon = "⚡" },
        },
      })
    end,
  },
}
