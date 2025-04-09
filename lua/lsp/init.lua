local lspconfig = require("lspconfig")

local capabilities = require("blink.cmp").get_lsp_capabilities()
local on_attach = require("lsp.defaults").on_attach

local servers = {
	"clangd",
	"cssls",
	"eslint",
	"gopls",
	"html",
	"jsonls",
	"lemminx",
	"lua_ls",
	"pyright",
	"sqlls",
	"tailwindcss",
	"taplo",
	"ts_ls",
}

for _, server in ipairs(servers) do
	local status, lsp_settings = pcall(require, "lsp.settings." .. server)
	if not status then
		lsp_settings = {}
	end

	lspconfig[server].setup(vim.tbl_deep_extend("force", {
		capabilities = capabilities,
		on_attach = on_attach,
	}, lsp_settings))
end

return {
	capabilities = capabilities,
	on_attach = on_attach,
}
