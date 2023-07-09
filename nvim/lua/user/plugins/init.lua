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
}
