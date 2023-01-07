vim.g.mapleader = ' '
local map = vim.keymap.set
local input = vim.api.nvim_input

map('n', 'w', 'b')
map({'n', 'i', 'v'}, '<S-w>', '<C-w>')


map('n', '<A-f>', ":FZF<CR>")


-- :tnoremap <Esc> <C-\><C-n>

map('t', '<Esc>', '<C-\\><C-n>')


-- toggle terminal
-- map({'n', 'i', 'v'}, '<A-t>', ':ToggleTerm<CR>')
-- map('t', '<A-t>', '<C-\\><C-n>:ToggleTerm<CR>')

-- map('n', '<A-t>', ':split<CR><C-w>j:terminal<CR>i')
-- map('t', '<A-t>', '<C-\\><C-n>:q!<CR>')


-- focus terminal
map('t', '<A-j>', '<C-\\><C-n><C-w>k')
map('n', '<A-j>', '<C-\\><C-n><C-w>j')
-- map('n', '<A-t>', function()
--   input(':split<CR>')
--   input('<C-w>j')
--   input(':terminal<CR>')
--   input('i')
-- end)

