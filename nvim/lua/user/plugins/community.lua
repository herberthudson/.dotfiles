return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.git.git-blame-nvim" },
	{ import = "astrocommunity.git.openingh-nvim" },
	{ import = "astrocommunity.editing-support.vim-move" },
	{ import = "astrocommunity.colorscheme.sonokai" },
	{
		"sonokai",
		event = "BufRead",
	},
	{ import = "astrocommunity.pack.rust" },
	{ import = "astrocommunity.pack.typescript" },
	{ import = "astrocommunity.pack.docker" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.go" },
	{ import = "astrocommunity.pack.html-css" },
	{ import = "astrocommunity.completion.codeium-vim" },
}
