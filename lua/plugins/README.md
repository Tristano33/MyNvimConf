# 🚀 Neovim Config — Como VS Code

Configuración de plugins para Neovim usando **lazy.nvim**. Diseñada para que te sientas como en **VS Code**, pero en la terminal.

> 💡 **Tip:** Presiona `<leader>` y espera un segundo para ver **which-key** con todos los atajos disponibles.

---

## 📦 Plugins instalados

### 🎨 Apariencia & UI

| Plugin | Archivo | Propósito |
|--------|---------|-----------|
| `folke/tokyonight.nvim` | `init.lua` | Esquema de colores TokyoNight Storm |
| `nvim-lualine/lualine.nvim` | `lualine.lua` | Barra de estado (como la barra inferior de VS Code) |
| `akinsho/bufferline.nvim` | `bufferline.lua` | Pestañas de buffers (como las tabs de VS Code) |
| `folke/noice.nvim` | `tools.lua` | UI moderna: cmdline popup, notificaciones bonitas |
| `goolord/alpha-nvim` | `alpha.lua` | Pantalla de inicio con accesos rápidos |
| `lukas-reineke/indent-blankline.nvim` | `tools.lua` | Guías de indentación vertical |
| `Isrothy/neominimap.nvim` | `neominimap.lua` | Minimapa al costado (como el de VS Code) |

| `folke/zen-mode.nvim` | `zen-mode.lua` | Modo de enfoque tipo Zen Mode de VS Code |
| `folke/twilight.nvim` | `zen-mode.lua` | Oscurece código fuera del foco (dependencia de Zen) |

### 🔍 Navegación & Búsqueda

| Plugin | Archivo | Propósito |
|--------|---------|-----------|
| `nvim-telescope/telescope.nvim` | `init.lua` | Buscador difuso (archivos, texto, buffers) — como `Ctrl+P` |
| `nvim-telescope/telescope-ui-select.nvim` | `init.lua` | UI unificada para menús de selección |
| `nvim-neo-tree/neo-tree.nvim` | `neotree.lua` | Explorador de archivos (como el sidebar de VS Code) |
| `folke/flash.nvim` | `flash.lua` | Saltar a cualquier texto visible en 2 teclas |
| `stevearc/aerial.nvim` | `aerial.lua` | Outline de símbolos (como `Ctrl+Shift+O`) |
| `RRethy/vim-illuminate` | `illuminate.lua` | Resalta la palabra bajo el cursor igual que VS Code |
| `kevinhwang91/nvim-ufo` | `ufo.lua` | Plegado de código con preview |

### 🧠 Lenguajes & LSP

| Plugin | Archivo | Propósito |
|--------|---------|-----------|
| `williamboman/mason.nvim` | `lsp.lua` | Gestor de instalaciones LSP |
| `williamboman/mason-lspconfig.nvim` | `lsp.lua` | Instalación automática de LSP servers |
| `neovim/nvim-lspconfig` | `lsp.lua` | Configuración LSP nativa (Neovim 0.11+) |
| `mfussenegger/nvim-jdtls` | `lsp.lua` | LSP para Java |
| `folke/trouble.nvim` | `trouble.lua` | Panel de diagnósticos (como el panel PROBLEMS de VS Code) |

### ✍️ Edición

| Plugin | Archivo | Propósito |
|--------|---------|-----------|
| `hrsh7th/nvim-cmp` | `lsp.lua` | Motor de autocompletado |
| `windwp/nvim-autopairs` | `tools.lua` | Cierre automático de paréntesis, comillas |
| `numToStr/Comment.nvim` | `tools.lua` | Comentar código con `gc` / `gcc` |
| `kylechui/nvim-surround` | `tools.lua` | Manipular rodeadores: `ys`, `cs`, `ds` |
| `nvim-treesitter/nvim-treesitter` | `treesitter.lua` | Resaltado de sintaxis por AST |
| `nvim-treesitter/nvim-treesitter-textobjects` | `treesitter.lua` | Text objects avanzados (funciones, clases, etc.) |

### 🫸 Git

| Plugin | Archivo | Propósito |
|--------|---------|-----------|
| `lewis6991/gitsigns.nvim` | `tools.lua` | Signos de Git en el gutter (como VS Code) |
| `NeogitOrg/neogit` | `neogit.lua` | Interfaz Git completa (como Source Control de VS Code) |
| `sindrets/diffview.nvim` | `neogit.lua` | Diffs visuales (dependencia de Neogit) |

### 🎯 Productividad

| Plugin | Archivo | Propósito |
|--------|---------|-----------|
| `folke/which-key.nvim` | `tools.lua` | Ayuda emergente al presionar `<leader>` |
| `akinsho/toggleterm.nvim` | `toggleterm.lua` | Terminal integrada (como `Ctrl+Ñ`) + Lazygit flotante |
| `folke/todo-comments.nvim` | `tools.lua` | Resaltar TODO, FIXME, HACK en el código |

---

## ⌨️ Tabla completa de keymaps

### 🏠 Alpha (pantalla de inicio)

| Tecla | Acción |
|-------|--------|
| `f` | Buscar archivo |
| `r` | Archivos recientes |
| `g` | Buscar texto en proyecto |
| `e` | Nuevo archivo |
| `s` | Abrir configuración |
| `q` | Salir |

### 🔍 Telescope — Búsqueda (como `Ctrl+P` en VS Code)

| Keymap | Acción | VS Code equivalente |
|--------|--------|---------------------|
| `<leader>ff` | Buscar archivos | `Ctrl+P` |
| `<leader>fg` | Buscar texto en proyecto | `Ctrl+Shift+F` |
| `<leader>fb` | Lista de buffers abiertos | `Ctrl+Tab` |
| `<leader>fh` | Buscar en help tags | — |
| `<leader>st` | Buscar TODOs | — |

### 📂 Neo-tree — Explorador de archivos (sidebar)

| Keymap | Acción | VS Code equivalente |
|--------|--------|---------------------|
| `<leader>e` | Abrir/cerrar explorador | `Ctrl+B` / `Ctrl+Shift+E` |

### 🔖 Aerial — Outline de símbolos

| Keymap | Acción | VS Code equivalente |
|--------|--------|---------------------|
| `<leader>a` | Abrir/cerrar outline | `Ctrl+Shift+O` |
| `{` | Símbolo anterior | — |
| `}` | Siguiente símbolo | — |

### ❌ Trouble — Panel de diagnósticos

| Keymap | Acción | VS Code equivalente |
|--------|--------|---------------------|
| `<leader>xx` | Abrir/cerrar diagnósticos | `Ctrl+Shift+M` (Problems) |
| `<leader>xX` | Diagnósticos del buffer actual | — |
| `<leader>cs` | Símbolos del documento | — |
| `<leader>xL` | Lista de ubicaciones | — |
| `<leader>xQ` | Lista quickfix | — |

### 🖥️ Terminal (toggleterm) + Lazygit

| Keymap | Modo | Acción | VS Code equivalente |
|--------|------|--------|---------------------|
| `<C-\>` | Global | Abrir/cerrar terminal | `` Ctrl+Ñ `` |
| `<Esc>` | Terminal | Salir a modo Normal | — |
| `<C-w>` | Terminal | Navegar entre ventanas | — |
| `<leader>gg` | Normal | Lazygit flotante (Git UI) | `Ctrl+Shift+G` |

### 🧘 Zen Mode — Modo de enfoque

| Keymap | Acción | VS Code equivalente |
|--------|--------|---------------------|
| `<leader>z` | Activar/desactivar Zen Mode | `Ctrl+K Z` / `Zen Mode` |

### 🪟 Ventanas — Splits y navegación

| Keymap | Acción | VS Code equivalente |
|--------|--------|---------------------|
| `<leader>wv` | Split vertical | `Ctrl+\` |
| `<leader>ws` | Split horizontal | `Ctrl+K Ctrl+\` |
| `<leader>wq` | Cerrar ventana actual | `Ctrl+W` |
| `<leader>wo` | Cerrar otras ventanas | — |
| `<leader>w=` | Igualar tamaño ventanas | — |
| `<A-h>` | Ir a ventana izquierda | `Ctrl+1` / clicks |
| `<A-j>` | Ir a ventana inferior | — |
| `<A-k>` | Ir a ventana superior | — |
| `<A-l>` | Ir a ventana derecha | `Ctrl+2` / clicks |
| `<C-Up>` | Aumentar altura de ventana | — |
| `<C-Down>` | Disminuir altura | — |
| `<C-Left>` | Reducir ancho | — |
| `<C-Right>` | Aumentar ancho | — |

### 📄 Bufferline — Pestañas

| Keymap | Acción | VS Code equivalente |
|--------|--------|---------------------|
| `<S-Right>` | Siguiente pestaña | `Ctrl+Tab` |
| `<S-Left>` | Pestaña anterior | `Ctrl+Shift+Tab` |
| `<leader>bd` | Cerrar buffer actual | `Ctrl+W` |

### 🧠 LSP — Navegación de código

| Keymap | Modo | Acción | VS Code equivalente |
|--------|------|--------|---------------------|
| `gd` | Normal | Ir a definición | `F12` |
| `gi` | Normal | Ir a implementación | `Ctrl+F12` |
| `gr` | Normal | Mostrar referencias | `Shift+F12` |
| `<leader>D` | Normal | Tipo en definición | — |
| `K` | Normal | Hover (información) | `Ctrl+K Ctrl+I` / Hover |
| `<leader>rn` | Normal | Renombrar símbolo | `F2` |
| `<leader>ca` | N/V | Acciones de código | `Ctrl+.` / `Ctrl+Shift+R` |
| `[d` | Normal | Diagnóstico anterior | — |
| `]d` | Normal | Siguiente diagnóstico | `F8` |
| `<leader>dx` | Normal | Mostrar diagnóstico en float | — |

### 🔧 nvim-cmp — Autocompletado

| Keymap | Modo | Acción |
|--------|------|--------|
| `<C-b>` | Inserción | Scroll arriba en docs |
| `<C-f>` | Inserción | Scroll abajo en docs |
| `<C-Space>` | Inserción | Forzar completado |
| `<CR>` | Inserción | Confirmar selección |
| `<Tab>` | Inserción | Siguiente ítem / fallback |

### 🫸 Git — Gitsigns (gutter)

| Keymap | Acción | VS Code equivalente |
|--------|--------|---------------------|
| `<leader>gb` | Toggle blame en línea | — |
| `<leader>gd` | Ver diff del archivo | — |
| `<leader>gD` | Ver diff contra HEAD~ | — |
| `<leader>gp` | Vista previa del hunk | — |
| `<leader>gB` | Blame completo | — |
| `<leader>gr` | Resetear hunk | — |
| `]h` | Siguiente hunk | — |
| `[h` | Hunk anterior | — |

### 🫸 Git — Neogit (Source Control UI)

| Keymap | Acción | VS Code equivalente |
|--------|--------|---------------------|
| `<leader>gs` | Abrir Neogit Status | `Ctrl+Shift+G` (Source Control) |
| `<leader>gc` | Hacer commit | — |

### 📝 TODO Comments

| Keymap | Acción |
|--------|--------|
| `]t` | Siguiente TODO |
| `[t` | TODO anterior |
| `<leader>st` | Buscar TODOs con Telescope |

### 🗺️ Neominimap — Minimapa (como VS Code)

| Keymap | Acción | VS Code equivalente |
|--------|--------|---------------------|
| `<leader>nm` | Abrir/cerrar minimapa | `Ctrl+Shift+P → Minimap` |
| `<leader>nf` | Enfocar minimapa | — |

### 🔼 Plegado de código (nvim-ufo)

| Keymap | Acción | VS Code equivalente |
|--------|--------|---------------------|
| `zR` | Abrir todos los pliegues | — |
| `zM` | Cerrar todos los pliegues | — |
| `zr` | Abrir pliegues por nivel | — |
| `zm` | Cerrar pliegues por nivel | — |
| `K` | Previsualizar línea plegada (o hover LSP) | — |

### ⚡ Flash.nvim — Navegación rápida

| Keymap | Modo | Acción |
|--------|------|--------|
| `s` | N/V/Operator | Saltar a texto visible escribiendo 2 caracteres |
| `S` | N/V/Operator | Saltar a nodo Treesitter |
| `r` | Operator-pending | Operador remoto (ej: `dr` para borrar con flash) |
| `R` | N/V/Operator | Búsqueda Treesitter resaltada |

### 🌳 Treesitter — Selección incremental

| Keymap | Acción |
|--------|--------|
| `gnn` | Iniciar selección |
| `grn` | Expandir al nodo siguiente |
| `grc` | Expandir al ámbito |
| `grm` | Reducir selección |

### 🌳 Treesitter — Text objects

| Text object | Selecciona |
|-------------|------------|
| `af` / `if` | Función (outer/inner) |
| `ac` / `ic` | Clase (outer/inner) |
| `al` / `il` | Bucle (outer/inner) |
| `ab` / `ib` | Bloque (outer/inner) |
| `ap` / `ip` | Parámetro (outer/inner) |
| `aO` / `iO` | Objeto (outer/inner) |
| `aA` / `iA` | Array (outer/inner) |

### 🌳 Treesitter — Movimiento

| Keymap | Acción |
|--------|--------|
| `]m` / `[m` | Siguiente/anterior función |
| `]c` / `[c` | Siguiente/anterior clase |
| `]a` / `[a` | Siguiente/anterior parámetro |

### 🌳 Treesitter — Intercambio

| Keymap | Acción |
|--------|--------|
| `<leader>sn` | Intercambiar con siguiente parámetro |
| `<leader>sp` | Intercambiar con anterior parámetro |

### 🔄 Otros atajos útiles

| Keymap | Modo | Acción |
|--------|------|--------|
| `gcc` | Normal | Comentar/descomentar línea |
| `gc` | Visual | Comentar/descomentar selección |
| `ys` | Normal | Rodear texto (you surround) |
| `cs` | Normal | Cambiar rodeador |
| `ds` | Normal | Borrar rodeador |

---

## 🗂️ Grupos de which-key

Al presionar `<leader>` + tecla, which-key muestra los grupos disponibles:

| Prefijo | Grupo | Plugins relacionados |
|---------|-------|---------------------|
| `<leader>a` | **[A]erial (Outline)** | Símbolos del documento |
| `<leader>b` | **[B]uffer** | Bufferline, cierre de buffers |
| `<leader>c` | **[C]ode** | LSP code actions, símbolos |
| `<leader>d` | **[D]ocument** | Diagnósticos, tipo en definición |
| `<leader>e` | **[E]xplorer** | Neo-tree |
| `<leader>g` | **[G]it** | Gitsigns, Neogit |
| `<leader>r` | **[R]ename** | Renombrar símbolo |
| `<leader>s` | **[S]earch** | Telescope, TODO search |
| `<leader>w` | **[W]indow** | Navegación de ventanas |
| `<leader>x` | **[X] Trouble / Diagnósticos** | Trouble panel |
| `<leader>w` | **[W]indow** | Splits, navegación, cerrar |
| `<leader>z` | **[Z]en Mode** | Zen Mode + Twilight |
| `[` | **Prev** | Diagnóstico, hunk, TODO anterior |
| `]` | **Next** | Diagnóstico, hunk, TODO siguiente |
| `g` | **Go to** | Navegación Treesitter |

---

## 🛠️ LSP Servers instalables

| Lenguaje | Servidor LSP |
|----------|-------------|
| PHP | `intelephense` |
| TypeScript / JavaScript | `ts_ls` (+ Vue) |
| Vue 3 | `vue` |
| Rust | `rust_analyzer` |
| C / C++ | `clangd` |
| Go | `gopls` |
| Python | `pyright` |
| Java | `jdtls` |

---

## 💡 Para empezar a usarlo

1. Abre Neovim y espera a que `lazy.nvim` instale todos los plugins
2. Ejecuta `:Mason` para verificar que los LSP servers se estén instalando
3. Presiona `<leader>ff` para buscar archivos — ¡el atajo que más usarás!
4. Presiona `<leader>` y espera un segundo para ver todos los atajos disponibles

### Los 10 keymaps que más usarás

| # | Keymap | Qué hace | Como en VS Code |
|---|--------|----------|-----------------|
| 1 | `<leader>ff` | Buscar archivos | `Ctrl+P` |
| 2 | `<leader>e` | Explorador de archivos | `Ctrl+B` |
| 3 | `gd` | Ir a definición | `F12` |
| 4 | `K` | Ver documentación | Hover mouse |
| 5 | `<leader>ca` | Acciones de código | `Ctrl+.` |
| 6 | `<C-\>` | Abrir terminal | `` Ctrl+Ñ `` |
| 7 | `<leader>bd` | Cerrar pestaña | `Ctrl+W` |
| 8 | `s` | Saltar a cualquier texto | — (único de Neovim) |
| 9 | `<leader>xx` | Ver errores | `Ctrl+Shift+M` |
| 10 | `<leader>gs` | Git status | `Ctrl+Shift+G` |

---

*Configuración para Neovim 0.11+ en Windows.*
