return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	vim.lsp.config.root_pattern("go.work", "go.mod", ".git"),
}
