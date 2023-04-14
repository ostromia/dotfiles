vim.g.mapleader = ' '
local map = vim.keymap.set
local input = vim.api.nvim_input

map('n', ';', ':', {noremap=true})

map({'n', 'v', 'i'}, '<A-a>', '<Esc>')

map('n', 'w', 'b')

map('n', '<A-o>', ":FZF<CR>")

map({'n', 'v', 'i'}, '<A-w>', '<C-w>')

-- copy & paste to system clipboard
map({'n', 'v'}, '<S-y>', '"+y')
map({'n', 'v'}, '<S-p>', '"+p')


-- view highlight groups
map({'n', 'v'}, '<leader>ss', function()
    local groups = " "
    for _, val in pairs(vim.fn.synstack(vim.fn.line("."), vim.fn.col("."))) do
        groups = groups .. vim.fn.synIDattr(val, "name") .. " "
    end
    print(groups)
end)

