---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'onedark',
  nvdash = {
    load_on_startup = true,
  },
  hl_override = {
    Visual                     = { bg = { "light_grey", -15 } },
    IndentBlanklineContextChar = { fg = { "white", -20 } },
    -- Diff preview changes highlighting
    DiffAdd                    = { fg = "NONE", bg = { "teal", -25 } },
    DiffDelete                 = { fg = "NONE", bg = { "red", -45 } },
    DiffText                   = { fg = "NONE", bg = { "sun", -50 } },
    -- Diff sidebar highlighting
    DiffChange                 = { fg = "blue" },
    LspInlayHint = {fg = "white"},
    -- NonText = {fg = "light_grey"}
  },
}
M.plugins = 'custom.plugins'
M.mappings = require 'custom.mappings'


return M
