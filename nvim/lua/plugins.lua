-- ~/.config/nvim/lua/plugins/*
require('plugins.barbar')
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.nvim-treesitter')

-- other
require('nvim-web-devicons').setup {}

require('Comment').setup {
  sticky = true
}

