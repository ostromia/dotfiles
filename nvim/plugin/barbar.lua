local mod = require("keybindings").mod

require('barbar').setup {
    animation = false,
    maximum_padding = 0,

    icons = {
        button = false,

        modified = {
            button = false
        },

        filetype = {
            enabled = false
        },

        separator = {
            left = '',
            right = ''
        },

        inactive = {
            separator = {
                left = '',
                right = ''
            }
        }
    }
}

-- keybindings
vim.keymap.set({"n", "v", "i"}, "<" .. mod .. "-h>", ":BufferPrevious<CR>", { noremap = true, silent = true })
-- defaults write -g NSUserKeyEquivalents -dict-add "Hide Ghostty" '@^~$h'
vim.keymap.set({"n", "v", "i"}, "<" .. mod .. "-l>", ":BufferNext<CR>", { noremap = true, silent = true })
