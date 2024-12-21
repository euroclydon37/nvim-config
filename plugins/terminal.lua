local state = {
	current = {
		buffer = -1,
		window = -1,
	},
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	-- Calculate the position to center the window
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	-- Create a buffer
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buffer) then
		buf = opts.buffer
	else
		buf = vim.api.nvim_create_buf(false, true) -- no file, scratch buffer
	end

	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	}

	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buffer = buf, window = win }
end

local function toggle_terminal()
	if not vim.api.nvim_win_is_valid(state.current.window) then
		state.current = create_floating_window({ buffer = state.current.buffer })
		if vim.bo[state.current.buffer].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(state.current.window)
	end
end

vim.keymap.set({ "n", "t" }, "<space><space>t", toggle_terminal, { nowait = true })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

print("updated")
