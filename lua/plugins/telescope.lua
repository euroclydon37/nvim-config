return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
	    local t = require("telescope.builtin")

	    -- Open telescope
	    vim.keymap.set("n", "<space>tt", function() vim.cmd('Telescope') end)

	    -- Open keymaps
	    vim.keymap.set("n", "<space><space>k", t.keymaps)

	    -- Find Files
	    vim.keymap.set("n", "<space>ff", t.find_files)

	    -- Find symbol
	    vim.keymap.set("n", "<space>fs", t.lsp_document_symbols)

	    -- Find references
	    vim.keymap.set("n", "<space>fr", t.lsp_references)

	    -- "Edit Neovim" - searches neovim config files
	    vim.keymap.set("n", "<space>en", function ()
		require('telescope.builtin').find_files {
		    cwd = vim.fn.stdpath("config")
		}
	    end)

	    require('telescope').setup({
		extensions = {
		    fzf = {}
		},
	    })

	    require('telescope').load_extension('fzf')
	end
}
