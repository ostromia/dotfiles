require('indent_blankline').setup {
  show_current_context_start = false,
  show_current_context = true,
  show_first_indent_level = false,
}

vim.cmd('highlight IndentBlanklineChar guifg=#282C34 gui=nocombine')

