require('telescope').setup()

-- keybindgs
local map = vim.keymap.set
map('n', '<A-f>', ":Telescope find_files<CR>")

