-- lua/plugins/which-key.lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Lo cargamos de forma perezosa para no afectar el inicio
  config = function()
    require("which-key").setup({
      -- Puedes dejar esto vacío para usar la configuración por defecto,
      -- que es excelente para empezar.
    })
  end,
}
