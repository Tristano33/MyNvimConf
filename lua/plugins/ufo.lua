return {
  -- ============================================================
  -- nvim-ufo — Plegado de código con preview (como VS Code)
  -- ============================================================
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost",
    init = function()
      vim.o.foldcolumn = "1" -- Columna de plegado
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    end,
    config = function()
      vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Abrir todos los pliegues" })
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Cerrar todos los pliegues" })
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Abrir pliegues nivel" })
      vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Cerrar pliegues nivel" })
      vim.keymap.set("n", "K", function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end, { desc = "Previsualizar pliegue / Hover LSP" })

      require("ufo").setup({
        provider_selector = function(_, filetype, _)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}
