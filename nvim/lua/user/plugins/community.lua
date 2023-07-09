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
  { import = "astrocommunity.pack.rust" }
}
