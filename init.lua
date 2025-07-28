require("options")

require("configs.lazy")

vim.cmd.colorscheme("catppuccin")
vim.diagnostic.config({ virtual_text = true })
vim.lsp.inlay_hint.enable(true)

require("highlights")

require("mappings")
