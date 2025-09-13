-- =====================================================================================
--                              KEYMAPS (VSCode-like)
-- =====================================================================================

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Leader key (como VSCode usa Ctrl, usaremos space)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================== GENERAL ==============================

-- Guardar con Ctrl+S (como VSCode)
keymap.set("n", "<C-s>", "<cmd>w<cr>", opts)
keymap.set("i", "<C-s>", "<cmd>w<cr><Esc>", opts)

-- Salir con Ctrl+Q
keymap.set("n", "<C-q>", "<cmd>qa<cr>", opts)

-- Deshacer con Ctrl+Z, Rehacer con Ctrl+Shift+Z
keymap.set("n", "<C-z>", "u", opts)
keymap.set("n", "<C-S-z>", "<C-r>", opts)

-- Seleccionar todo con Ctrl+A
keymap.set("n", "<C-a>", "ggVG", opts)

-- ============================== NAVEGACIÓN ==============================

-- Moverse entre ventanas (como VSCode)
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Redimensionar ventanas
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- ============================== TABS/BUFFERS ==============================

-- Tabs como VSCode (Ctrl+T nueva, Ctrl+W cerrar)
keymap.set("n", "<C-t>", "<cmd>enew<cr>", opts)
keymap.set("n", "<C-w>", "<cmd>bd<cr>", opts)

-- Navegar entre tabs (Ctrl+PageUp/PageDown como VSCode)
keymap.set("n", "<C-PageUp>", "<cmd>bprevious<cr>", opts)
keymap.set("n", "<C-PageDown>", "<cmd>bnext<cr>", opts)

-- ============================== EXPLORADOR DE ARCHIVOS ==============================

-- Toggle explorador con Ctrl+Shift+E (como VSCode)
keymap.set("n", "<C-S-e>", "<cmd>NvimTreeToggle<cr>", opts)
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- ============================== BÚSQUEDA ==============================

-- Buscar archivos con Ctrl+P (como VSCode)
keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)

-- Buscar texto con Ctrl+Shift+F (como VSCode)
keymap.set("n", "<C-S-f>", "<cmd>Telescope live_grep<cr>", opts)

-- Buscar en archivo actual con Ctrl+F
keymap.set("n", "<C-f>", "/", opts)

-- Buscar en buffers abiertos
keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "[B]uscar en buffers abiertos" })

-- ============================== TERMINAL ==============================

-- Toggle terminal con Ctrl+` (como VSCode)
keymap.set("n", "<C-`>", "<cmd>ToggleTerm<cr>", opts)
keymap.set("t", "<C-`>", "<cmd>ToggleTerm<cr>", opts)

-- ============================== COMANDOS ==============================

-- Command palette con Ctrl+Shift+P (como VSCode)
keymap.set("n", "<C-S-p>", "<cmd>Telescope commands<cr>", opts)

-- ============================== EDICIÓN ==============================

-- Comentar líneas con Ctrl+/ (como VSCode)
keymap.set("n", "<C-_>", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", opts)
keymap.set("v", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)

-- Mover líneas arriba/abajo con Alt+Up/Down (como VSCode)
keymap.set("n", "<A-Up>", ":m .-2<cr>==", opts)
keymap.set("n", "<A-Down>", ":m .+1<cr>==", opts)
keymap.set("v", "<A-Up>", ":m '<-2<cr>gv=gv", opts)
keymap.set("v", "<A-Down>", ":m '>+1<cr>gv=gv", opts)

-- Duplicar línea con Shift+Alt+Down (como VSCode)
keymap.set("n", "<S-A-Down>", ":t.<cr>", opts)

-- Indentación con Tab/Shift+Tab en modo visual
keymap.set("v", "<Tab>", ">gv", opts)
keymap.set("v", "<S-Tab>", "<gv", opts)

-- ============================== LSP ==============================

-- Go to definition con F12 (como VSCode)
keymap.set("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)

-- Go to references con Shift+F12 (como VSCode)
keymap.set("n", "<S-F12>", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

-- Rename con F2 (como VSCode)
keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

-- Hover con K
keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)

-- Quick fix con Ctrl+.
keymap.set("n", "<C-.>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

-- Format con Shift+Alt+F (como VSCode)
keymap.set("n", "<S-A-f>", "<cmd>lua vim.lsp.buf.format()<cr>", opts)

-- ============================== OTROS ==============================

-- Clear search highlight con Esc
keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)

-- Better paste (no pierde el registro)
keymap.set("v", "p", '"_dP', opts)

-- Mantener búsqueda centrada
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

-- ============================== DEBUGGING ==============================

keymap.set("n", "<leader>d", "", { noremap = true, silent = true, nowait = true, desc = "[D]ebug" })
keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle [B]reakpoint" })
keymap.set("n", "<leader>dc", function() require("dap").continue() end, { desc = "[C]ontinue" })
keymap.set("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step [I]nto" })
keymap.set("n", "<leader>do", function() require("dap").step_out() end, { desc = "Step [O]ut" })
keymap.set("n", "<leader>dO", function() require("dap").step_over() end, { desc = "Step [O]ver" })
keymap.set("n", "<leader>dr", function() require("dap").repl.toggle() end, { desc = "Toggle [R]EPL" })
keymap.set("n", "<leader>dt", function() require("dap").terminate() end, { desc = "[T]erminate" })

-- ============================== AI / AVANTE ==============================

keymap.set("n", "<leader>a", "<cmd>Avante<cr>", { desc = "[A]vante AI" })
keymap.set("n", "<leader>ac", "<cmd>AvanteChat<cr>", { desc = "[C]hat con Avante" })
keymap.set("n", "<leader>aa", "<cmd>AvanteAsk<cr>", { desc = "[A]sk Avante" })

-- Atajos en modo Visual (para cuando seleccionas texto)
keymap.set("v", "<leader>a", ":Avante<cr>", { desc = "Avante [A]I" })
