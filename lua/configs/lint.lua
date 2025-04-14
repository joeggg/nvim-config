local lint = require("lint")
lint.linters_by_ft = { python = { "mypy", "ruff" } }

lint.linters.mypy.cmd = ".venv/bin/mypy"
lint.linters.ruff.cmd = ".venv/bin/ruff"

vim.api.nvim_create_autocmd({ "BufWinEnter", "TextChanged", "TextChangedI", "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
