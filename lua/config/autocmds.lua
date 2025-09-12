-- =====================================================================================
--                                  AUTOCOMMANDS
-- =====================================================================================

local autocmd = vim.api.nvim_create_autocmd

-- Resaltar texto copiado
autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Restaurar posición del cursor al abrir un buffer
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line = mark[1]
    local col = mark[2]
    if line > 1 and line <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, {line, col})
    end
  end,
  desc = "Restaurar posición del cursor al abrir un archivo",
})

-- Remover espacios en blanco al guardar
autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
  desc = "Remover espacios en blanco al final de la línea al guardar",
})

-- Auto cerrar NvimTree si es la última ventana
autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})