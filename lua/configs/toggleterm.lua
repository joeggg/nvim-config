local width_pct = 0.9
local height_pct = 0.8

return {
  shade_terminals = false,
  highlights = {
    NormalFloat = { guifg = "#cdd6f4", guibg = "#342038" },
    Normal = { guifg = "#cdd6f4", guibg = "#342038" },
  },
  float_opts = {
    border = "none",
    width = function()
      local screen_w = vim.opt.columns:get()
      return math.floor(screen_w * width_pct)
    end,
    height = function()
      local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
      return math.floor(screen_h * height_pct)
    end,
    row = function()
      local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
      local s_h = math.floor(screen_h * height_pct)
      return (screen_h - s_h) / 2
    end,
    col = function()
      local screen_w = vim.opt.columns:get()
      local w_h = math.floor(screen_w * width_pct)
      return (screen_w - w_h) / 2
    end,
  },
}
