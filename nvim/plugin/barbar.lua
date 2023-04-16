require('bufferline').setup {
    animation = false,
    maximum_padding = 0,

    icons = {
        button = false,
        modified = { button = false },
        filetype = { enabled = false },

        separator = { left = '', right = '' },
        inactive = { separator = { left = '', right = '' } }
    }
}

-- ensure tabs begin with the shown buffer
local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
    return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
    bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
    bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
    bufferline_api.set_offset(0)
end)

-- keybindings
local map = vim.keymap.set
map({'n', 'v', 'i'}, '<A-l>', ':BufferNext<CR>')
map({'n', 'v', 'i'}, '<A-h>', ':BufferPrevious<CR>')
map('n', '<A-q>', ':BufferClose<CR>')

