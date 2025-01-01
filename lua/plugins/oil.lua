return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "-", function()
			vim.cmd("Oil")
		end, { desc = "Open parent directory with Oil.nvim" })
	end,
}