local M = {}
M.mod = vim.fn.has("mac") == 1 and "D" or "M"

vim.g.mapleader = ' '

vim.keymap.set('n', ';', ':')

vim.keymap.set({'n', 'v', 'i'}, '<' .. M.mod .. '-a>', '<Esc>')

vim.keymap.set('n', 'w', 'b')

vim.keymap.set({"n", "v"}, "d", '"+d', { noremap = true })
vim.keymap.set({"n", "v"}, "y", '"+y', { noremap = true })
vim.keymap.set({"n", "v"}, "p", '"+p', { noremap = true })

return M
