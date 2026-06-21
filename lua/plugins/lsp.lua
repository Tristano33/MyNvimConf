return {
  -- ============================================================
  -- 1. Mason: Gestor de instalaciones de LSP servers en Windows
  -- ============================================================
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "intelephense",  -- PHP
          "ts_ls",         -- TypeScript
          "vue",           -- Vue 3
          "rust_analyzer", -- Rust
          "clangd",        -- C / C++
          "gopls",         -- Go
          "pyright",       -- Python
          "jdtls",         -- Java (instalado por Mason, manejado por nvim-jdtls)
        },
      })
    end,
  },

  -- ============================================================
  -- 2. LSP Config (API nativa Neovim 0.11+)
  -- ============================================================
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- ---------------------------------------------------------
      -- Configuración global de diagnósticos
      -- ---------------------------------------------------------
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          spacing = 4,
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.INFO] = "●",
            [vim.diagnostic.severity.HINT] = "●",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- ---------------------------------------------------------
      -- Servidores con configuración simple
      -- ---------------------------------------------------------
      local servers = { "intelephense", "clangd", "gopls", "pyright", "vue" }
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
      end
      vim.lsp.enable(servers)

      -- ---------------------------------------------------------
      -- TypeScript + Vue 3 (plugin de Vue integrado)
      -- ---------------------------------------------------------
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = "@vue/language-server",
              location = vim.fn.stdpath("data")
                .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
              languages = { "vue" },
            },
          },
        },
        filetypes = {
          "typescript", "javascript", "javascriptreact", "typescriptreact", "vue",
        },
      })
      vim.lsp.enable("ts_ls")

      -- ---------------------------------------------------------
      -- Rust Analyzer (modo standalone, sin Cargo.toml obligatorio)
      -- ---------------------------------------------------------
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        cmd = { "rust-analyzer" },
        root_dir = function(bufnr)
          -- vim.fs.root acepta tanto bufnr (número) como filename (string)
          local cargo_crate = vim.fs.root(bufnr, { "Cargo.toml" })
          if cargo_crate then
            return cargo_crate
          end
          local filename = vim.api.nvim_buf_get_name(bufnr)
          return vim.fs.dirname(filename)
        end,
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = { group = "module" },
              prefix = "self",
            },
            diagnostics = { enable = true },
          },
        },
      })
      vim.lsp.enable("rust_analyzer")

      -- ---------------------------------------------------------
      -- Mapeos globales para el LSP nativo
      -- ---------------------------------------------------------
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }

          -- Navegación de código
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)          -- Ir a definición
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)      -- Ir a implementación
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)          -- Mostrar referencias
          vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts) -- Tipo en definición

          -- Información y documentación
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)               -- Información al vuelo

          -- Acciones de código
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)      -- Renombrar símbolo
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- Acciones de código

          -- Navegación de diagnósticos
          vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
          end, opts)                                                          -- Diagnóstico anterior
          vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
          end, opts)                                                          -- Siguiente diagnóstico
          vim.keymap.set("n", "<leader>dx", function()
            vim.diagnostic.open_float()
          end, opts)                                                          -- Flotante de diagnóstico
        end,
      })
    end,
  },

  -- ============================================================
  -- 3. Java LSP (nvim-jdtls) - Solo se carga para archivos Java
  -- ============================================================
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      local function setup_jdtls()
        local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

        -- Buscar el launcher JAR (la versión puede variar)
        local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
        if launcher_jar == "" then
          vim.notify("jdtls: No se encontró el launcher JAR. ¿Ejecutaste :Mason y lo instalaste?", vim.log.levels.WARN)
          return
        end

        -- Directorio de configuración específico para Windows
        local config_dir = jdtls_path .. "/config_win"

        -- Workspace por proyecto (para no mezclar configuraciones)
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        local workspace_dir = vim.fn.stdpath("data") .. "/java_workspace/" .. project_name

        require("jdtls").start_or_attach({
          cmd = {
            "java",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xmx1g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens", "java.base/java.util=ALL-UNNAMED",
            "--add-opens", "java.base/java.lang=ALL-UNNAMED",
            "-jar", launcher_jar,
            "-configuration", config_dir,
            "-data", workspace_dir,
          },
          root_dir = vim.fs.root(0, {
            ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "settings.gradle",
          }),
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
      end

      -- Se ejecuta cada vez que entras a un buffer Java
      local jdtls_group = vim.api.nvim_create_augroup("JdtlsConfig", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = jdtls_group,
        pattern = "java",
        callback = setup_jdtls,
      })
    end,
  },

  -- ============================================================
  -- 4. Motor de Autocompletado (nvim-cmp)
  -- ============================================================
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}

