return {

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			{
				's1n7ax/nvim-window-picker',
				version = '2.*',
				config = function()
					require 'window-picker'.setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { 'neo-tree', "neo-tree-popup", "notify" },
								-- if the buffer type is one of following, the window will be ignored
								buftype = { 'terminal', "quickfix" },
							},
						},
					})
				end,
			},
		},
		config = function()
			vim.fn.sign_define("DiagnosticSignError",
				{ text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn",
				{ text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo",
				{ text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint",
				{ text = "󰌵", texthl = "DiagnosticSignHint" })
			require("neo-tree").setup({
				enable_git_status = true,
				enable_diagnostics = true,
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "󰜌",
					-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
					-- then these will never be used.
					default = "*",
					highlight = "NeoTreeFileIcon"
				},
				modified = {
					symbol = "+",
					highlight = "NeoTreeModified",
				},
				file_size = {
					enabled = true,
					required_width = 64, -- min width of window required to show this column
				},
			})
		end

	}

}
