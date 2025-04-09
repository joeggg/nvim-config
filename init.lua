require("options")

require("configs.lazy")

vim.cmd.colorscheme("catppuccin")
vim.diagnostic.config({ virtual_text = true })

require("mappings")
