require('nvim-web-devicons').setup()

require('Comment').setup({
  sticky = true
})

require("indent_blankline").setup({
  show_current_context_start = false,
  show_current_context = true,
})

require'colorizer'.setup()

-- ~/.config/nvim/lua/plugins/*
require('plugins.barbar')
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.nvim-treesitter')
require('plugins.telescope')

