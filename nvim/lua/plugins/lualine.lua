local cbase16 = require'lualine.themes.base16'
cbase16.normal.c.bg = "#21252B"

require'lualine'.setup{
  options = {
    theme = cbase16,

    section_separators = '',
    component_separators = '',
  },

  sections = {
    lualine_a = {
      'mode'
    },

    lualine_b = {
      'branch', 'diff', 'diagnostics'
    },

    lualine_c = {},

    lualine_x = {
      'filetype',
      'encoding',
      'fileformat',
    },

    lualine_y = {},

    lualine_z = {
      'location'
    }
  }
}

