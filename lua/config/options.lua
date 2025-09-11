-- =====================================================================================
--                                  OPTIONS (VSCode-like)
-- =====================================================================================

local opt = vim.opt

-- General
opt.mouse = "a"                       -- Habilitar mouse
opt.clipboard = "unnamedplus"         -- Usar clipboard del sistema
opt.swapfile = false                  -- No crear archivos swap
opt.backup = false                    -- No crear backups
opt.undofile = true                   -- Habilitar undo persistente
opt.updatetime = 250                  -- Tiempo de actualización más rápido
opt.timeoutlen = 400                  -- Tiempo para combinaciones de teclas

-- UI
opt.number = true                     -- Números de línea
opt.relativenumber = true             -- Números relativos
opt.signcolumn = "yes"                -- Siempre mostrar columna de signos
opt.wrap = false                      -- No wrap de líneas
opt.scrolloff = 8                     -- Líneas de contexto al scrollear
opt.sidescrolloff = 8                 -- Columnas de contexto lateral
opt.termguicolors = true              -- True colors
opt.showmode = false                  -- No mostrar modo (usamos lualine)

-- Indentación (como VSCode)
opt.expandtab = true                  -- Usar espacios en lugar de tabs
opt.shiftwidth = 2                    -- Tamaño de indentación
opt.tabstop = 2                       -- Tamaño visual del tab
opt.softtabstop = 2                   -- Tamaño del tab en inserción
opt.autoindent = true                 -- Auto indentación
opt.smartindent = true                -- Indentación inteligente

-- Búsqueda
opt.ignorecase = true                 -- Ignorar mayúsculas en búsqueda
opt.smartcase = true                  -- Ser inteligente con las mayúsculas
opt.hlsearch = true                   -- Resaltar búsquedas
opt.incsearch = true                  -- Búsqueda incremental

-- Splits (como VSCode)
opt.splitright = true                 -- Splits verticales a la derecha
opt.splitbelow = true                 -- Splits horizontales abajo

-- Completado
opt.completeopt = "menuone,noselect"  -- Mejor experiencia de autocompletado

-- Folding (plegado de código)
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Otros
opt.conceallevel = 0                  -- No ocultar caracteres especiales
opt.cursorline = true                 -- Resaltar línea actual
opt.laststatus = 3                    -- Status global
opt.cmdheight = 1                     -- Altura de línea de comandos
opt.pumheight = 10                    -- Altura del popup de completado
