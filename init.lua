require("config.lazy")
require("custom.terminal")

vim.keymap.set("n", "<space><space>q", function()
	vim.cmd("q")
end, { desc = "Shortcut for :q" })

vim.keymap.set("n", "<space><space>x", function()
	vim.cmd("source %")
end, { desc = "Runs source %" })

vim.keymap.set("n", "<space>/", function()
	vim.cmd('let @/ = ""')
end, { desc = "Clears current search term." })

vim.keymap.set("n", "<space><space>wv", function()
	vim.cmd("vsplit")
end, { desc = "Creates a vertical split." })

vim.keymap.set("n", "<space><space>wh", function()
	vim.cmd("split")
end, { desc = "Creates a horizontal split." })

-- Window navigation
local function move_window_right()
	vim.cmd("wincmd l")
end

local function move_window_left()
	vim.cmd("wincmd h")
end

local function move_window_up()
	vim.cmd("wincmd k")
end

local function move_window_down()
	vim.cmd("wincmd j")
end

vim.keymap.set("n", "<c-l>", move_window_right, { desc = "Move right one window." })
vim.keymap.set("n", "<c-h>", move_window_left, { desc = "Move left one window." })
vim.keymap.set("n", "<c-k>", move_window_up, { desc = "Move up one window." })
vim.keymap.set("n", "<c-j>", move_window_down, { desc = "Move down one window." })

vim.keymap.set("n", "<space>wl", move_window_right, { desc = "Move right one window." })
vim.keymap.set("n", "<space>wh", move_window_left, { desc = "Move left one window." })
vim.keymap.set("n", "<space>wk", move_window_up, { desc = "Move up one window." })
vim.keymap.set("n", "<space>wj", move_window_down, { desc = "Move down one window." })

-- Tab navigation
local function move_tab_right()
	vim.cmd("tabnext")
end
local function move_tab_left()
	vim.cmd("tabprevious")
end
local function new_tab()
	vim.cmd("tabnew")
end

vim.keymap.set("n", "<space>tl", move_tab_right, { desc = "Move right one tab." })
vim.keymap.set("n", "<space>th", move_tab_left, { desc = "Move left one tab." })
vim.keymap.set("n", "<space>nt", new_tab, { desc = "Move left one tab." })

-- Settings
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
