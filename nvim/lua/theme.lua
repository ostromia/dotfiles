require('nvim-web-devicons').setup {}

require('onedark').setup {
  style = 'dark',
  
  code_style = { comments = 'none' },

  highlights = {
    ['@parameter'] = {fg = '$fg'},
  }
}
require('onedark').load()

-- ":h treesitter-highlight-groups"
