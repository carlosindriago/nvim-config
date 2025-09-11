-- =====================================================================================
--                           NEOVIM VSCODE-LIKE CONFIGURATION
-- =====================================================================================

-- Configuración básica
require('config.options')
require('config.keymaps')
require('config.autocmds')

-- Bootstrap lazy.nvim (gestor de plugins)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Cargar plugins
require("lazy").setup("plugins", {
  defaults = { lazy = false },
  ui = {
    border = "rounded",
    title = "Plugin Manager",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Tema
vim.cmd.colorscheme("catppuccin-mocha")
