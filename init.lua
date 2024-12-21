require("config.lazy")

vim.keymap.set("n", "<space><space>q", function()
	vim.cmd("q")
end)

vim.keymap.set("n", "<space><space>x", function()
	vim.cmd("source %")
end)

vim.keymap.set("n", "<space><space>w", function()
	vim.cmd("w")
end)

vim.keymap.set("n", "<space><space>wq", function()
	vim.cmd("wq")
end)

vim.keymap.set("n", "<space>/", function()
	vim.cmd('let @/ = ""')
end)

vim.keymap.set("n", "<space>wv", function()
	vim.cmd("vsplit")
end)

vim.keymap.set("n", "<space>wh", function()
	vim.cmd("split")
end)

-- Move right 1 window
vim.keymap.set("n", "<space>wl", function()
	vim.cmd("wincmd l")
end)

-- Move left 1 window
vim.keymap.set("n", "<space>wh", function()
	vim.cmd("wincmd h")
end)

-- Move up 1 window
vim.keymap.set("n", "<space>wk", function()
	vim.cmd("wincmd k")
end)

-- Move down 1 window
vim.keymap.set("n", "<space>wj", function()
	vim.cmd("wincmd j")
end)

vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
