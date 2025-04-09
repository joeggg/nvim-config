local on_attach = require("lsp").on_attach
local capabilities = require("lsp").capabilities

local opts = {
	server = {
		on_attach = function(client, bufnr)
			client.server_capabilities.semanticTokensProvider = nil
			on_attach(client, bufnr)
			vim.lsp.inlay_hint.enable(true)
		end,
		capabilities = capabilities,
		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
					loadOutDirsFromCheck = true,
					runBuildScripts = true,
				},
				-- Add clippy lints for Rust.
				checkOnSave = {
					allFeatures = true,
					command = "clippy",
					extraArgs = { "--no-deps" },
				},
				procMacro = {
					enable = true,
					ignored = {
						["async-trait"] = { "async_trait" },
						["napi-derive"] = { "napi" },
						["async-recursion"] = { "async_recursion" },
					},
				},
			},
		},
	},
}

return opts
