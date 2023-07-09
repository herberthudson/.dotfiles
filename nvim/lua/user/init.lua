return {
  plugins = {
    "mbbill/undotree",
    event = "BufRead",
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end
  }
}
