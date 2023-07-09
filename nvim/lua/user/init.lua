return {
  plugins = {
    {
      "mbbill/undotree",
      cmd = "UndotreeToggle",
      config = function()
        vim.g.undotree_SetFocusWhenToggle = 1
      end
    },
    {
      "ThePrimeagen/vim-be-good",
      cmd = "VimBeGood",
    }
  }
}
