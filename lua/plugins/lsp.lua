return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- Mason setup
    require("mason").setup({
      ui = {
        border = "rounded",
      },
      ensure_installed = {
        -- Install ruff with mason directly
        "ruff",
      },
    })

    -- mason-lspconfig setup
    require("mason-lspconfig").setup({
      -- This list now only contains servers that mason-lspconfig can handle directly
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
        "pyright",
        "clangd",
      },
    })

    -- LSP settings
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Common on_attach function
    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr }

      -- LSP Keymaps
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

      -- Add formatting on save for supported servers
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end

    -- Automatic server setup
    local servers = require("mason-lspconfig").get_installed_servers()
    for _, server_name in ipairs(servers) do
      lspconfig[server_name].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    -- Manual setup for ruff, as it's not handled by the bridge
    lspconfig.ruff.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}