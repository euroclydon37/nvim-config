require("config.lazy")
require("custom.open_in_github")

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

vim.keymap.set("n", "<space>wl", move_window_right, { desc = "Move right one window." })
vim.keymap.set("n", "<space>wh", move_window_left, { desc = "Move left one window." })
vim.keymap.set("n", "<space>wk", move_window_up, { desc = "Move up one window." })
vim.keymap.set("n", "<space>wj", move_window_down, { desc = "Move down one window." })

-- Window resizing
local function resize_window_down()
	vim.cmd("resize +2")
end

local function resize_window_up()
	vim.cmd("resize -2")
end

local function resize_window_right()
	vim.cmd("vertical resize +4")
end

local function resize_window_left()
	vim.cmd("vertical resize -4")
end

vim.keymap.set("n", "L", resize_window_right, { desc = "Move right one window.", noremap = true })
vim.keymap.set("n", "H", resize_window_left, { desc = "Move left one window.", noremap = true })
vim.keymap.set("n", "K", resize_window_up, { desc = "Move up one window.", noremap = true })
vim.keymap.set("n", "J", resize_window_down, { desc = "Move down one window.", noremap = true })

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

local function open_diagnostic()
	vim.diagnostic.open_float()
end

local function next_diagnostic()
	vim.diagnostic.goto_next()
end

local function previous_diagnostic()
	vim.diagnostic.goto_prev()
end

local function code_actions()
	vim.lsp.buf.code_action()
end

vim.keymap.set("n", "<space><space>d", open_diagnostic, { desc = "Open diagnostic floating window." })
vim.keymap.set("n", "<space>dl", next_diagnostic, { desc = "Go to next diagnostic." })
vim.keymap.set("n", "<space>dh", previous_diagnostic, { desc = "Go to previous diagnostic." })
vim.keymap.set("n", "<space>ca", code_actions, { desc = "Open code actions." })

-- Settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
