return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    vim.o.background = "light"  -- or "dark" for dark mode
    vim.cmd([[colorscheme gruvbox]])
  end,
  opts = {},
}
