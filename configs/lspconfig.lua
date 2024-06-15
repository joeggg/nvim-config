local config = require('plugins.configs.lspconfig')

local lspconfig = require 'lspconfig'
local util = require 'lspconfig/util'

local default_opts_servers = { "jsonls", "taplo", "tsserver", "eslint", "sqlls", "tailwindcss" }

for _, lsp in ipairs(default_opts_servers) do
  lspconfig[lsp].setup {
    on_attach = config.on_attach,
    capabilities = config.capabilities,
  }
end

lspconfig.pyright.setup {
  on_attach = config.on_attach,
  capabilities = config.capabilities,
  filetypes = { "python" },
  settings = {
    python = {
      pythonPath = ".venv/bin/python",
      analysis = {
        diagnosticSeverityOverrides = {},
      }
    },
  },
}

lspconfig.eslint.setup {
  on_attach = config.on_attach,
  capabilities = config.capabilities,
  settings = {
    experimental = {
      useFlatConfig = false,
    },
  }
}

lspconfig.gopls.setup {
  on_attach = config.on_attach,
  capabilities = config.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  util.root_pattern("go.work", "go.mod", ".git"),
}

lspconfig.clangd.setup {
  filetypes = { "cpp" },
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    config.on_attach(client, bufnr)
  end,
  capabilities = config.capabilities,
}
