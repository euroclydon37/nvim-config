return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			modules = {},
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "typescript", "tsx" },
			ignore_install = {},
			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
		})
	end,
}
