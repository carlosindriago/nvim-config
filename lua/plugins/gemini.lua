-- lua/plugins/gemini.lua
return {
  "kiddos/gemini.nvim",
  -- Habilitamos la carga perezosa con los comandos que descubrimos
  cmd = {
    "GeminiApply",
    "GeminiChat",
    "GeminiCodeExplain",
    "GeminiCodeReview",
    "GeminiFunctionHint",
    "GeminiTask",
    "GeminiUnitTest",
  },
  config = function() 
    require("gemini").setup({
      -- La configuración va aquí.
    })
  end,
}