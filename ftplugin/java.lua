local home = vim.fn.getenv("USERPROFILE")
local root_markers = { "pom.xml", "build.gradle", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)

if root_dir == "" then
  return
end

-- Nombre del proyecto basado en la carpeta raíz
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = home .. "\\AppData\\Local\\nvim-data\\jdtls\\workspace\\" .. project_name

-- Configuración del comando para arrancar jdtls desde Mason
local config = {
  cmd = {
    "jdtls",
    "-data", workspace_dir,
  },
  root_dir = root_dir,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

-- Mapeos rápidos para Java
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})

-- Arrancar el servidor
require("jdtls").start_or_attach(config)
