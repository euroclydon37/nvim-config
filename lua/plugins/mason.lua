return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")

		mason.setup({})
		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"html",
				"lua_ls",
				"graphql",
			}
		})
		lspconfig.ts_ls.setup({})
	end,
}
