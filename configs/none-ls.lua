local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local none_ls = require 'null-ls'

local opts = {
  sources = {
    none_ls.builtins.formatting.clang_format,
    require("none-ls.formatting.jq"),
    require("none-ls.formatting.ruff_format").with({
      prefer_local = ".venv/bin",
      extra_args = { "--line-length", "100" },
    }),
    require("none-ls.diagnostics.ruff").with({ prefer_local = ".venv/bin" }),
    -- Sort imports and remove unused for python
    require("none-ls.formatting.ruff").with({
      prefer_local = ".venv/bin",
      args = {
        "ruff",
        "check",
        "--fix",
        "--select",
        "I,F401",
        "-e",
        "-n",
        "--stdin-filename",
        "$FILENAME",
        "-",
      },
    }),
    none_ls.builtins.diagnostics.mypy.with({ prefer_local = ".venv/bin" }),
    none_ls.builtins.formatting.gofmt,
    none_ls.builtins.formatting.goimports,
  },
  -- To format on save using the loaded lsp formatter
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      })
    end
  end
}

return opts
