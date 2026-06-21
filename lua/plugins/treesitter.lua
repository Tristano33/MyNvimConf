return {
  -- ============================================================
  -- 1. nvim-treesitter — Resaltado de sintaxis por AST
  -- ============================================================
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ok, ts_configs = pcall(require, "nvim-treesitter.config")
      if not ok then
        vim.notify("Treesitter no disponible aún. Abre Neovim normalmente y ejecuta :Lazy", vim.log.levels.WARN)
        return
      end
      ts_configs.setup({
        ensure_installed = {
          "lua", "vim", "vimdoc", "query",
          "javascript", "typescript", "tsx",
          "vue", "html", "css", "scss",
          "json", "yaml", "toml",
          "markdown", "markdown_inline",
          "python", "rust", "go",
          "c", "cpp", "java",
          "php", "bash",
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      })
    end,
  },

  -- ============================================================
  -- 2. nvim-treesitter-textobjects — Text objects avanzados
  -- ============================================================
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      local ok, ts_configs = pcall(require, "nvim-treesitter.config")
      if not ok then
        vim.notify("Treesitter-textobjects no disponible aún. Abre Neovim normalmente.", vim.log.levels.WARN)
        return
      end
      ts_configs.setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
              ["ap"] = "@parameter.outer",
              ["ip"] = "@parameter.inner",
              ["aO"] = "@object.outer",
              ["iO"] = "@object.inner",
              ["aA"] = "@array.outer",
              ["iA"] = "@array.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]c"] = "@class.outer",
              ["]a"] = "@parameter.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[c"] = "@class.outer",
              ["[a"] = "@parameter.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>sn"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>sp"] = "@parameter.inner",
            },
          },
        },
      })
    end,
  },
}
