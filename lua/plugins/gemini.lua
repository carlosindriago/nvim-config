-- lua/plugins/gemini.lua
return {
  "jonroosevelt/gemini-cli.nvim",
  -- Cargamos el plugin de forma perezosa cuando se llame a uno de sus comandos
  cmd = { "Gemini", "GeminiWrite", "GeminiVisual" },
  config = function() 
    require("gemini").setup({
      -- La configuración va aquí. El plugin usará automáticamente la variable de entorno GEMINI_API_KEY.
    })
  end,
}
