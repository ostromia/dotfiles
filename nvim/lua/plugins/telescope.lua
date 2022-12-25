local map = vim.keymap.set
local input = vim.api.nvim_input

require('telescope').setup()

local builtin = require('telescope.builtin')

map('n', '<A-f>', ":Telescope find_files<CR>")

