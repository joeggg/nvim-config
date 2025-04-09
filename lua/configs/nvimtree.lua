return {
	disable_netrw = true,
	actions = { open_file = { quit_on_open = true } },
	filters = { git_ignored = false },
	update_focused_file = {
		enable = true,
	},
	view = {
		float = {
			enable = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local w_h = math.floor(screen_w * 0.2)
				local s_h = math.floor(screen_h * 0.7)
				local center_x = (screen_w - w_h) / 2
				local center_y = ((vim.opt.lines:get() - s_h) / 5) - vim.opt.cmdheight:get()
				return {
					border = "rounded",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = w_h,
					height = s_h,
				}
			end,
		},
	},
	renderer = { icons = { glyphs = { git = { unstaged = "!" } } } },
}
