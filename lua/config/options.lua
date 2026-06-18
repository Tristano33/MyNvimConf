vim.opt.number = true          -- Muestra números de línea
vim.opt.relativenumber = true  -- Números relativos (básico para moverse rápido)
vim.opt.clipboard = "unnamedplus" -- Sincroniza el portapapeles de Neovim con Windows
vim.opt.tabstop = 4            -- Tamaño de tabulación
vim.opt.shiftwidth = 4
vim.opt.expandtab = true       -- Convierte tabs en espacios
vim.opt.smartindent = true     -- Indentación inteligente
vim.opt.termguicolors = true   -- Colores reales en la terminal
-- Atajo global definitivo para abrir/cerrar el explorador de archivos
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Alternar explorador de archivos" })