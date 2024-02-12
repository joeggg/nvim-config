---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'everblush',
  nvdash = {
    load_on_startup = true,
  },
  gitsigns = {
    current_line_blame = true,
  }
}
M.plugins = 'custom.plugins'


return M
