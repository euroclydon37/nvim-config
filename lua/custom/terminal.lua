local state = {
	buffer = {},
	window = -1,
}

local function get_buffer(buffer_index)
	local buffer_number = state.buffer[buffer_index] or -1
	if vim.api.nvim_buf_is_valid(buffer_number) then
		return buffer_number
	else
		buffer_number = vim.api.nvim_create_buf(false, true) -- no file, scratch buffer
		state.buffer[buffer_index] = buffer_number
		print(buffer_number)
		return buffer_number
	end
end

local function show_floating_window(buffer_number)
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)

	-- Calculate the position to center the window
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	}

	state.window = vim.api.nvim_open_win(buffer_number, true, win_config)
end

local function show_terminal(buffer_index)
	return function()
		local buffer_number = get_buffer(buffer_index)

		-- Either show the window or change the buffer
		if not vim.api.nvim_win_is_valid(state.window) then
			show_floating_window(buffer_number)
		else
			vim.api.nvim_win_set_buf(state.window, buffer_number)
		end

		if vim.bo[buffer_number].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
	end
end

local function hide_terminal()
	if vim.api.nvim_win_is_valid(state.window) then
		vim.api.nvim_win_hide(state.window)
	end
end

-- The buffer hotkeys
vim.keymap.set({ "n", "t" }, "<space><space>t1", show_terminal(1), { nowait = true })
vim.keymap.set({ "n", "t" }, "<space><space>t2", show_terminal(2), { nowait = true })
vim.keymap.set({ "n", "t" }, "<space><space>t3", show_terminal(3), { nowait = true })
vim.keymap.set({ "n", "t" }, "<space><space>t4", show_terminal(4), { nowait = true })
vim.keymap.set({ "n", "t" }, "<space><space>t5", show_terminal(5), { nowait = true })

vim.keymap.set({ "n", "t" }, "<space><space>th", hide_terminal, { nowait = true })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
