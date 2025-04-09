require("mappings.dap")

local map = vim.keymap.set

map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

map("t", "<C-x>", "<C-\\><C-N>", { desc = "escape terminal mode" })

map({ "n", "v", "s", "o" }, "<C-l>", function()
	vim.cmd("NvimTreeToggle")
end)

-- Terminal
map({ "n", "t" }, "<A-i>", function()
	require("terminal").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "terminal toggle floating term" })

-- Format
map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })

-- Scope
map("n", "<leader>co", function()
	vim.cmd("IBLToggleScope")
end, { desc = "toggle scope lines" })

require("mappings.movement")
