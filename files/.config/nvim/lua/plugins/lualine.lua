return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function() 
    require('lualine').setup {
      options = {
        always_show_tabline = false,
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'branch', { 'filename', path = 1, symbols = { modified = '' } } },
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = {
          { 'progress', left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { { 'filename', path = 1, symbols = { modified = '' } } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_b = { { 'tabs', mode = 1 } },
      },
      extensions = {},
    }
  end,
}
