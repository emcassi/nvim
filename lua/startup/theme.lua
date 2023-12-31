local function get_fomatted_time()
	local time = os.date("*t")

	local period = "AM"
	if time.hour > 12 then
		period = "PM"
	end

	local hour = time.hour % 12
	if hour == 0 then
		hour = 12
	end

	local date = os.date("%B %d, %Y")
	return string.format("%s - %02d:%02d %s", date, hour, time.min, period)
end

local settings = {
	header = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Header",
		margin = 5,
		content = {
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠠⠤⠤⠤⠤⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠉⠀⠈⠈⢌⢊⠢⡂⡢⠨⡩⢒⠢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠐⠡⡂⡪⠨⡂⢕⠨⡂⡪⡑⡢⣀⠀⠀⠀⠀⠀⠀⢀⡠⠤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⢠⠀⠰⠄⠀⠀⠀⠈⡢⡑⢌⠢⡵⣾⣦⢊⢔⢐⢍⠢⣄⢀⢔⠪⡑⢌⢬⠃⠀⠀⠀⠀⠀⠀⠀⢀⡠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢇⠀⠀⠀⠀⠀  ⠀⠀⠊⢔⢹⣅⣼⢿⡇⡢⢑⢐⢅⠢⡙⠶⣡⢊⠔⡍⠀⠀⠀⠀⠀⠀⢀⠔⢅⢢⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⢀⡀⠠⠀⠀⢀⠀⣀ ⡊⡻⠿⡛⠔⢌⢢⢑⠄⠕⢌⠪⠨⡓⢮⡃⠀⠀⠀⠀⠀⢠⠣⢡⢑⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠘⡧⣭⡰⣎⡢⣭⡻⠀⠀⠨⢨⠨⡊⡢⠣⡲⡡⢃⠕⡨⢊⠔⡡⠩⠢⢄⡀⠀⢀⠇⡅⠕⡴⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢄⠈⠪⠍⣚⠩⠕⠁⠀⠀⠀⠀⠁⠢⡊⢌⠕⡜⠢⡑⢌⠢⡑⢌⠪⡘⠔⢌⠍⢝⠨⡂⢍⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⡀⠀⠀⠀⠀⠀⠀⠀ ⠀ ⠀⠈⠐⠡⢊⢌⠢⡑⢌⠢⡑⢌⠢⡑⢅⢊⡢⠋⠒⠣⠵⠬⠦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⣄ ⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠈⠐⠁⠊⠀⠁⠈⡠⠒⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡋⡓⢧⣢⡠⢀⠀⠀ ⠀ ⠀ ⢀⠀⢀⢀⢀⠄⢄⡴⠜⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡚⠀⠈⢢⠖⠉⠑⠓⠵⢧⠀⠀⠀⠀⢸⡌⠦⠮⠒⠉⠁⠀⠀⠀⠀⠀⠀⣠⣆⠀⠀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢪⠀⡰⠁⠀⠀⠀⠀⠀⠈⢦⠀⠀ ⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⣯⢿⣧⡀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠈⢣⡂ ⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⣿⠂⠻⣷⡿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠪⣢⠝⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠁⠀⠙⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		},
		highlight = "Statement",
		default_color = "",
		oldfiles_amount = 0,
	},
	-- name which will be displayed and command
	body = {
		type = "mapping",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Basic Commands",
		margin = 5,
		content = {
			{ " Find File in Workspace", "Telescope find_files", "|" },
			{ "\u{F126} Find File in Git Repo", "Telescope git_files", "\\" },
			{ "\u{1F50D}" .. "Find Word", "Telescope live_grep", "<leader>f" },
			{ " Recent Files", "Telescope oldfiles", "<leader>?" },
			{ " File Browser", "NvimTreeToggle", "<C-P>" },
			{ " Colorschemes", "Telescope colorscheme", "<leader>cs" },
			{ " New File", "lua require'startup'.new_file()", "<leader>nf" },
		},
		highlight = "String",
		default_color = "",
		oldfiles_amount = 0,
	},

	clock = {
		type = "text",
		content = function()
			return { "  " .. get_fomatted_time() }
		end,
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Clock",
		margin = 50,
		highlight = "TSString",
		default_color = "#FFFFFF",
		oldfiles_amount = 10,
	},

	options = {
		mapping_keys = true,
		cursor_column = 0.5,
		empty_lines_between_mappings = true,
		disable_statuslines = true,
		paddings = { 1, 3, 3, 0 },
	},
	mappings = {
		execute_command = "<CR>",
		open_file = "o",
		open_file_split = "<c-o>",
		open_section = "<TAB>",
		open_help = "?",
	},
	colors = {
		background = "#1f2227",
		folded_section = "#56b6c2",
	},
	parts = { "header", "body", "clock" },
}

return settings
