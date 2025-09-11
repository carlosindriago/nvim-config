return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup({
      indent = {
        char = "┊",
        tab_char = "┊",
      },
      whitespace = {
        highlight = { "Whitespace", "NonText" },
      },
      scope = { enabled = false },
    })
  end,
}
