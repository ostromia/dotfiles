local cbase16 = require'lualine.themes.base16'
cbase16.normal.c.bg = "#21252B"

require'lualine'.setup{
  options = {
    theme = cbase16,
    section_separators = '',
    component_separators = ''
  },

  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},

    lualine_x = {
      'filetype',
      'encoding',
      'fileformat',
    },

    lualine_y = {
      'branch', 'diff', 'diagnostics'
    },

    lualine_z = {
      'location',

      {
        'mode',
        padding = { left = 0, right = 3 }
      },
    }
  }
}

