require('nvim-web-devicons').setup()
require('onedark').load()
require('Comment').setup({
  sticky = true
})

-- ~/.config/nvim/lua/plugins/*
require('plugins.barbar')
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.telescope')

