vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#ffe054" })
vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#8cffab" })
vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#ff9787" })

-- Indent/scope colours
vim.api.nvim_set_hl(0, "@ibl.scope.char.1", { fg = "#21609c" })
vim.api.nvim_set_hl(0, "@ibl.scope.underline.1", { sp = "#21609c", underline = true })

vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#10344a" })
vim.api.nvim_set_hl(0, "DiffText", { bg = "#544c00" })

vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#a1abcc", bg = "#2c2b4a" })
