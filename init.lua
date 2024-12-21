require("config.lazy")

vim.keymap.set("n", "<space><space>q", function() vim.cmd("q") end)

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
