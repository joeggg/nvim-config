return {
	{
		"rmagatti/auto-session",
		opts = { auto_save = true },
	},
	{
		"williamboman/mason.nvim",
		init = function()
			local mr = require("mason-registry")
			local ensure_installed = {
				"css-lsp",
				"clangd",
				"clang-format",
				"debugpy",
				"eslint-lsp",
				"gopls",
				"html-lsp",
				"json-lsp",
				"lemminx",
				"lua-language-server",
				"prettier",
				"prettierd",
				"pyright",
				"rust-analyzer",
				"sqlls",
				"stylua",
				"tailwindcss-language-server",
				"taplo",
				"typescript-language-server",
			}

			mr.refresh(function()
				for _, tool in ipairs(ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end)
		end,
		opts = function()
			return require("configs.mason")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = function()
			return require("configs.treesitter")
		end,
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			winopts = { border = "shadow", preview = { border = "shadow" } },
			fzf_colors = { bg = { "bg", "NormalFloat" } },
			oldfiles = { include_current_session = true },
		},
		keys = {
			{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Search files" },
			{ "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "Search oldfiles" },
			{ "<leader>fw", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
		},
	},
}
