-- require('toggleterm').setup {}



-- toggle terminal

-- map('t', '<Esc>', '<C-\\><C-n>')

-- map({'n', 'i', 'v'}, '<A-t>', ':ToggleTerm<CR>')
-- map('t', '<A-t>', '<C-\\><C-n>:ToggleTerm<CR>')

-- map('n', '<A-t>', ':split<CR><C-w>j:terminal<CR>i')
-- map('t', '<A-t>', '<C-\\><C-n>:q!<CR>')

-- map('n', '<A-2>', function()
--   local c = vim.fn.wslclipboard
--
--   local c = vim.vim
-- end)

-- focus terminal
-- map('t', '<A-j>', '<C-\\><C-n><C-w>k')
-- map('n', '<A-j>', '<C-\\><C-n><C-w>j')
-- map('n', '<A-t>', function()
--   input(':split<CR>')
--   input('<C-w>j')
--   input(':terminal<CR>')
--   input('i')
-- end)

