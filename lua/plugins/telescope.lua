return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local t = require("telescope.builtin")

		-- Open telescope
		vim.keymap.set("n", "<space>tt", function()
			vim.cmd("Telescope")
		end, { desc = "Run the Telescope command to search everything." })

		-- Open keymaps
		vim.keymap.set("n", "<space>fk", t.keymaps, { desc = "Search keymaps with Telescope" })

		-- Find Files
		vim.keymap.set("n", "<space>ff", t.find_files, { desc = "Search files with Telescope" })

		-- Find Text
		vim.keymap.set("n", "<space>ft", t.live_grep, { desc = "Search project for text with Telescope" })

		-- Find Buffer
		vim.keymap.set("n", "<space>fb", t.buffers, { desc = "Search open buffers" })

		-- Find symbol
		vim.keymap.set(
			"n",
			"<space>fs",
			t.lsp_document_symbols,
			{ desc = "Search symbols in the current file with Telescope" }
		)

		-- Find definition
		vim.keymap.set(
			"n",
			"<space>fd",
			t.lsp_definitions,
			{ desc = "Search for definitions of the symbol under the cursor with Telescope" }
		)

		-- Find references
		vim.keymap.set(
			"n",
			"<space>fr",
			t.lsp_references,
			{ desc = "Search for all references to the symbol under the cursor with Telescope" }
		)

		-- "Edit Neovim" - searches neovim config files
		vim.keymap.set("n", "<space>en", function()
			require("telescope.builtin").find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end, { desc = "Search Neovim config files with Telescope. Makes it easy to edit neovim settings." })

		require("telescope").setup({
			pickers = {
				diagnostics = {
					severity = {
						min = vim.diagnostic.severity.WARN,
					},
				},
			},
			extensions = {
				fzf = {},
			},
		})

		require("telescope").load_extension("fzf")
	end,
}
