local config = require('plugins.configs.lspconfig')

local lspconfig = require 'lspconfig'

lspconfig.pyright.setup {
  on_attach = config.on_attach,
  capabilities = config.capabilities,
  filetypes = {"python"},
  settings = {
    python = {
      pythonPath = ".venv/bin/python",
      analysis = {
        diagnosticSeverityOverrides = {},
      }
    },
  },
}

lspconfig.jsonls.setup {
  on_attach = config.on_attach,
  capabilities = config.capabilities,
}

lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    config.on_attach(client, bufnr)
  end,
  capabilities = config.capabilities,
}

