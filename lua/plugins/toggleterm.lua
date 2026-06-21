return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<C-\>]], -- Atajo global: Ctrl + \ para abrir/ocultar
        hide_numbers = true,
        shade_terminals = true,
        direction = 'horizontal', -- Se abre abajo horizontalmente
        close_on_exit = true,
        shell = "powershell", -- Forzamos el uso de tu PowerShell estilizada con Oh My Posh
      })

      -- ==========================================================
      -- Lazygit: terminal flotante para Git UI (como VS Code Source Control)
      -- ==========================================================
      local Terminal = require("toggleterm.terminal").Terminal

      local lazygit_term = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        float_opts = {
          border = "double",
        },
        -- Cerrar con 'q' y auto-start en insert
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        on_close = function()
          vim.cmd("stopinsert!")
        end,
      })

      -- Función global para togglear lazygit
      function _G.lazygit_toggle()
        lazygit_term:toggle()
      end

      vim.keymap.set("n", "<leader>gg", "<cmd>lua _G.lazygit_toggle()<CR>", { desc = "Lazygit (Git UI flotante)" })

      -- ==========================================================
      -- Mapeos para la terminal
      -- ==========================================================
      local function set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts) -- Esc en la terminal → modo normal
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts) -- Navegar ventanas desde la terminal
      end

      -- Aplicar mapeos automáticamente al abrir cualquier terminal
      local term_group = vim.api.nvim_create_augroup("ToggleTermMappings", { clear = true })
      vim.api.nvim_create_autocmd("TermOpen", {
        group = term_group,
        pattern = "term://*",
        callback = set_terminal_keymaps,
      })
    end,
  }
}