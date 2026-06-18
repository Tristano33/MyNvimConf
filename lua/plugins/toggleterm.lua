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

      -- Truco crucial: Mapeos para poder moverte FUERA de la terminal fácilmente
      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts) -- Esc en la terminal te pasa a modo normal de Neovim
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts) -- Navegar ventanas desde la terminal
      end

      -- Acoplar los mapeos automáticamente al abrir cualquier terminal
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end
  }
}