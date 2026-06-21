return {
  -- ============================================================
  -- windows.lua — Keymaps de navegación y splits de ventanas
  -- ============================================================
  {
    -- Plugin dummy para agrupar keymaps de ventanas
    -- No instala nada, solo agrupa keymaps bajo lazy.nvim
    "folke/which-key.nvim",
    -- Este spec no instala un plugin nuevo, solo usa which-key
    -- como ancla para el lazy loading de estos keymaps
    event = "VeryLazy",
    config = function()
      -- ============================================================
      -- Splits (como VS Code: Ctrl+\ para split vertical)
      -- ============================================================
      vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Split vertical" })
      vim.keymap.set("n", "<leader>ws", "<cmd>split<CR>", { desc = "Split horizontal" })
      vim.keymap.set("n", "<leader>wq", "<cmd>close<CR>", { desc = "Cerrar ventana actual" })
      vim.keymap.set("n", "<leader>wo", "<cmd>only<CR>", { desc = "Cerrar otras ventanas" })
      vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Igualar tamaño ventanas" })

      -- ============================================================
      -- Navegación entre ventanas con Alt + hjkl
      -- NOTA: Se usa Alt en vez de Ctrl porque <C-h> = <BS> en terminales
      -- y <C-l> sobreescribe el default :nohlsearch
      -- ============================================================
      vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Ventana izquierda" })
      vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Ventana abajo" })
      vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Ventana arriba" })
      vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Ventana derecha" })

      -- ============================================================
      -- Redimensionar ventanas con Ctrl + flechas
      -- ============================================================
      vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Aumentar altura" })
      vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Disminuir altura" })
      vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Reducir ancho" })
      vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Aumentar ancho" })
    end,
  },
}
