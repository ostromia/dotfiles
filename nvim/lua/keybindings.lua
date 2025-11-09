vim.g.mapleader = ' '

vim.keymap.set('n', ';', ':')

vim.keymap.set({'n', 'v', 'i'}, '<D-a>', '<Esc>')

vim.keymap.set('n', 'w', 'b')

vim.keymap.set({"n", "v"}, "d", '"+d', { noremap = true })
vim.keymap.set({"n", "v"}, "y", '"+y', { noremap = true })
vim.keymap.set({"n", "v"}, "p", '"+p', { noremap = true })

