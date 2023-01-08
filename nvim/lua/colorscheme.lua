-- ":h treesitter-highlight-groups"

require('onedark').setup {
  style = 'dark',
  
  code_style = { comments = 'none' },

  highlights = {
    ['@parameter'] = {fg = '$fg'},
  }
}
require('onedark').load()

require('indent_blankline').setup {
  show_current_context_start = false,
  show_current_context = true,
}

vim.cmd('highlight IndentBlanklineChar guifg=#282C34 gui=nocombine')

