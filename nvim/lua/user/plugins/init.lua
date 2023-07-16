return {
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		config = function()
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},
	{
		"ThePrimeagen/vim-be-good",
		cmd = "VimBeGood",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = {
						text = "+",
					},
					change = {
						text = "±",
					},
					changedelete = {
						text = "⨦",
					},
					delete = {
						text = "✖",
					},
				},
			})
		end,
	},
	{
		"rebelot/heirline.nvim",
		opts = function(_, opts)
			local status = require("astronvim.utils.status")
			opts.statusline = {
				hl = { fg = "fg", bg = "bg" },
				status.component.mode({
					mode_text = {
						n = "NORMAL",
						i = "INSERT",
						v = "VISUAL",
						V = "V-LINE",
						c = "COMMAND",
						s = "SELECT",
						S = "S-LINE",
						[""] = "SELECT BLOCK",
						t = "TERMINAL",
						padding = {
							left = 1,
							right = 1,
						},
					},
				}),
				status.component.git_branch(),
				status.component.file_info({ filetype = {}, filename = false, file_modified = false }),
				status.component.git_diff(),
				status.component.diagnostics(),
				status.component.fill(),
				status.component.cmd_info(),
				status.component.fill(),
				status.component.lsp(),
				status.component.treesitter(),
				status.component.nav(),
			}
			return opts
		end,
	},
	{
		"wintermute-cell/gitignore.nvim",
		cmd = "Gitignore",
	},
}
