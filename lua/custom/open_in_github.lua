local function open_line_in_github()
	-- Get the current file path
	local file_path = vim.fn.expand("%:p")
	if file_path == "" then
		print("No file path found!")
		return
	end

	-- Get the line number under the cursor
	local line_number = vim.fn.line(".")

	-- Determine the repository root
	local repo_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	if repo_root == "" then
		print("Failed to find the repository root.")
		return
	end

	-- Normalize paths to ensure they work correctly
	repo_root = vim.fn.fnamemodify(repo_root, ":p")
	file_path = vim.fn.fnamemodify(file_path, ":p")

	-- Get the relative file path
	local relative_path = file_path:sub(#repo_root + 1)

	-- Get the remote URL
	local git_url = vim.fn.systemlist("git config --get remote.origin.url")[1]
	if git_url == "" then
		print("Failed to get the Git remote URL.")
		return
	end

	-- Transform the git URL into a GitHub URL
	git_url = git_url:gsub("^git@", "https://")
	git_url = git_url:gsub("%.git$", "")

	-- Assume the branch is 'main' (or modify this logic as needed)
	local branch = "main"

	-- Construct the GitHub URL
	local github_url = string.format("%s/blob/%s/%s#L%d", git_url, branch, relative_path, line_number)

	-- Open the URL in the default browser
	local cmd = string.format('xdg-open "%s"', github_url)
	if vim.fn.has("mac") == 1 then
		cmd = string.format('open "%s"', github_url)
	elseif vim.fn.has("win32") == 1 then
		cmd = string.format('start "%s"', github_url)
	end

	print(cmd)
	os.execute(cmd)
end

vim.api.nvim_create_user_command("OpenLineInGitHub", open_line_in_github, { desc = "Open the current line in GitHub" })
vim.keymap.set("n", "<space>ogh", open_line_in_github, { desc = "Open the current line in GitHub" })
