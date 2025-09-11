return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = " 🔍 ",
        selection_caret = " ",
        path_display = { "truncate" },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-n>"] = require("telescope.actions").move_selection_next,
            ["<C-p>"] = require("telescope.actions").move_selection_previous,
            ["<Esc>"] = require("telescope.actions").close,
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
        },
        live_grep = {
          theme = "dropdown",
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
        },
      },
    })
    require("telescope").load_extension("fzf")
  end,
}
