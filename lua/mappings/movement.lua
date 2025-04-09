local map = vim.keymap.set

-- Mappings for voyager with APT layout
-- Swap j and k
map({ "n", "v", "s", "o" }, "j", "k")
map({ "n", "v", "s", "o" }, "k", "j")
map({ "n", "v", "s", "o" }, "<C-j>", "<C-w>k")
map({ "n", "v", "s", "o" }, "<C-k>", "<C-w>j")
map({ "n", "v", "s", "o" }, "<C-w>j", "<C-w>k")
map({ "n", "v", "s", "o" }, "<C-w>k", "<C-w>j")
-- Swap n and l
map({ "n", "v", "s", "o" }, "n", "l")
map({ "n", "v", "s", "o" }, "l", "n")
map({ "n", "v", "s", "o" }, "N", "L")
map({ "n", "v", "s", "o" }, "L", "N")
