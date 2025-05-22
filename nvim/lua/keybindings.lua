vim.g.mapleader = ' '

vim.keymap.set('n', ';', ':')

vim.keymap.set({'n', 'v', 'i'}, '<D-a>', '<Esc>')

vim.keymap.set('n', '<D-o>', ":FZF<CR>")

vim.keymap.set('n', 'w', 'b')

-- copy & paste to named register & system clipboard
vim.keymap.set({'n', 'v'}, '<S-y>', '"+y')
vim.keymap.set({'n', 'v'}, '<S-p>', '"+p')

vim.keymap.set({"n", "v"}, "y", '"ay', { noremap = true })
vim.keymap.set({"n", "v"}, "p", '"ap', { noremap = true })

