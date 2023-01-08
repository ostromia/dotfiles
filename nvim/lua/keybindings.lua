-- vim.g.mapleader = ' '
local map = vim.keymap.set
local input = vim.api.nvim_input

map({'n', 'v', 'i'}, '<A-q>', '<Esc>')

map('n', 'w', 'b')

map('n', '<A-f>', ":FZF<CR>")

map({'n', 'v', 'i'}, '<A-w>', '<C-w>')

-- copy & paste to system clipboard
map({'n', 'v'}, '<S-y>', '"+y')
map({'n', 'v'}, '<S-p>', '"+p')

