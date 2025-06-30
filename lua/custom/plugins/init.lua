-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
			"echasnovski/mini.pick", -- optional
			"folke/snacks.nvim", -- optional
		},
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>g", ":Neogit<CR>", { noremap = true })
		end,
	},
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
		config = function()
			local hop = require("hop")
			hop.setup()
			local directions = require("hop.hint").HintDirection
			vim.keymap.set("", "m", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
			end, { remap = true })
			vim.keymap.set("", "M", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
			end, { remap = true })
			vim.keymap.set("n", "<leader>my", ":HopYankChar1<CR>", { noremap = true })
			vim.keymap.set("n", "<leader>mp", ":HopPasteChar1<CR>", { noremap = true })
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				on_open = nil,
				on_close = nil,
				render = "default",
				timeout = 5000,
				title = "Notification",
				stages = "fade_in_slide_out",
				icons = {
					ERROR = "",
					WARN = "",
					INFO = "",
					DEBUG = "",
					TRACE = "✎",
				},
				max_width = nil,
				max_height = nil,
				min_width = nil,
				min_height = nil,
				padding = nil,
				opacity = nil,
			})
			vim.notify = require("notify")
		end,
	},
	{
		"streamline.nvim",
		dir = "~/Dev/streamline",
		name = "streamline",
		dev = true,
		config = function()
			require("streamline").setup()
			vim.keymap.set("n", "<leader>sb", ":StreamBuffers<CR>", { noremap = true })
		end,
	},
}
