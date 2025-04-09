return {
	{
		"lewis6991/gitsigns.nvim",
		opts = { current_line_blame = true },
	},
	{
		"sindrets/diffview.nvim",
		opts = function()
			local actions = require("diffview.actions")
			return {
				keymaps = {
					file_panel = {
						{ "n", "j", actions.prev_entry, { desc = "Bring the cursor to the previous file entry" } },
						{ "n", "k", actions.next_entry, { desc = "Bring the cursor to the next file entry" } },
					},
					file_history_panel = {
						{ "n", "j", actions.prev_entry, { desc = "Bring the cursor to the previous file entry" } },
						{ "n", "k", actions.next_entry, { desc = "Bring the cursor to the next file entry" } },
					},
				},
			}
		end,
		keys = {
			{
				"<leader>df",
				function()
					if next(require("diffview.lib").views) == nil then
						vim.cmd("DiffviewOpen")
					else
						vim.cmd("DiffviewClose")
					end
				end,
				{ desc = "open diff" },
			},
			{
				"<leader>hh",
				function()
					if next(require("diffview.lib").views) == nil then
						vim.cmd("DiffviewFileHistory %")
					else
						vim.cmd("DiffviewClose")
					end
				end,
				{ desc = "open file history" },
			},
		},
	},
}
