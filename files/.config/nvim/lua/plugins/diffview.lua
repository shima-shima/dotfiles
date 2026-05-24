return {
  "sindrets/diffview.nvim",
  lazy = false,
  opts = {},
  config = function()
    vim.opt.fillchars:append { diff = "╱" }
    vim.api.nvim_set_hl(0, 'DiffDelete', { bg = "NONE", fg = "#565f89" })
  end,
}
