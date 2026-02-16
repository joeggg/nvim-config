local capabilities = require("blink.cmp").get_lsp_capabilities()
local on_attach = require("lsp.defaults").on_attach

local servers = {
  "arduino_language_server",
  "clangd",
  "cssls",
  "docker_language_server",
  "eslint",
  "gopls",
  "html",
  "jsonls",
  "lemminx",
  "lua_ls",
  "basedpyright",
  "sqlls",
  "tailwindcss",
  "taplo",
  "ts_ls",
}

for _, server in ipairs(servers) do
  local status, lsp_settings = pcall(require, "lsp.settings." .. server)
  if not status then
    lsp_settings = {}
  end

  vim.lsp.enable(server)

  vim.lsp.config(
    server,
    vim.tbl_deep_extend("force", {
      capabilities = capabilities,
      on_attach = on_attach,
    }, lsp_settings)
  )
end

return {
  capabilities = capabilities,
  on_attach = on_attach,
}
