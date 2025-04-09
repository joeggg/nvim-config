-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH

-- Numbers
vim.o.number = true
vim.o.numberwidth = 4
vim.o.relativenumber = true
vim.o.ruler = true

-- Indentation
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2

-- Cursor
vim.o.cursorline = true
vim.o.cursorlineopt = "both"
