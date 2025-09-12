-- lua/plugins/minimap.lua
return {
  'gorbit99/codewindow.nvim',
  -- Forzamos la carga del plugin al inicio
  lazy = false,
  config = function()
    -- La configuración se ejecuta al cargar el plugin
    require('codewindow').setup({
      -- width = 25,
    })

    -- Creamos el atajo manualmente
    vim.keymap.set('n', '<leader>m', '<Cmd>CodewindowToggle<CR>', {
      noremap = true,
      silent = true,
      desc = 'Minimapa: Mostrar / Ocultar'
    })
  end
}
