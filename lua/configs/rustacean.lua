local capabilities = require("blink.cmp").get_lsp_capabilities()
local on_attach = require("lsp.defaults").on_attach

local opts = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    default_settings = {
      -- rust-analyzer language server configuration
      ["rust-analyzer"] = {
        procMacro = {
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" },
          },
        },
      },
    },
  },
}

return opts
