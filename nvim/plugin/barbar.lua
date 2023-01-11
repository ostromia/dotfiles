require('bufferline').setup {
  icons = false,
  animation = false,

  maximum_padding = 0,

  closable = false,
  icon_separator_active = '',
  icon_separator_inactive = ''
}

-- ensure tabs begin with the shown buffer
local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size() + 1)
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size() + 1)
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)

-- keybindings
local map = vim.keymap.set
map({'n', 'v', 'i'}, '<A-l>', ':BufferNext<CR>')
map({'n', 'v', 'i'}, '<A-h>', ':BufferPrevious<CR>')
map('n', '<A-c>', ':BufferClose<CR>')

