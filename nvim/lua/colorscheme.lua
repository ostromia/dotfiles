-- ":h treesitter-highlight-groups"

require'onedark'.setup {
  style = 'dark',
  
  code_style = {comments = 'none'},

  highlights = {
    ['@parameter'] = {fg = '$fg'},
  }
}

require'onedark'.load()

