return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "-", function()
			vim.cmd("Oil")
		end, { desc = "Open parent directory with Oil.nvim" })
	end,
}
