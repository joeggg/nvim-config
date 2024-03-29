local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local none_ls = require 'null-ls'

local opts = {
  sources = {
    none_ls.builtins.formatting.clang_format,
    none_ls.builtins.formatting.jq,
    none_ls.builtins.formatting.black.with({
      prefer_local = ".venv/bin",
      extra_args = {"-l", "100"},
    }),
    none_ls.builtins.diagnostics.mypy.with({ prefer_local = ".venv/bin" }),
    none_ls.builtins.diagnostics.ruff.with({ prefer_local = ".venv/bin" }),
  },
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      })
    end
  end
}

return opts
