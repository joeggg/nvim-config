require("mappings.dap")
require("mappings.movement")

local map = vim.keymap.set

map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

map("t", "<C-x>", "<C-\\><C-N>", { desc = "escape terminal mode" })
map({ "n", "t" }, "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map({ "n", "v", "s", "o" }, "<C-l>", function()
	vim.cmd("NvimTreeToggle")
end)

map({ "n", "t" }, "<A-i>", function()
	require("terminal").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "terminal toggle floating term" })

map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })

map("n", "<leader>co", function()
	vim.cmd("IBLToggleScope")
end, { desc = "toggle scope lines" })
