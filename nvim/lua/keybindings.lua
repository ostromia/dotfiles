vim.g.mapleader = ' '
local map = vim.keymap.set
local input = vim.api.nvim_input

map('n', ';', ':', {noremap=true})

map({'n', 'v', 'i'}, '<D-a>', '<Esc>')

map('n', 'w', 'b')

map('n', '<D-o>', ":FZF<CR>")

map({'n', 'v', 'i'}, '<D-w>', '<C-w>')

-- copy & paste to system clipboard
map({'n', 'v'}, '<S-y>', '"+y')
map({'n', 'v'}, '<S-p>', '"+p')

-- window movement
map('n', '<S-h>', '<C-w>h')
map('n', '<S-j>', '<C-w>j')
map('n', '<S-k>', '<C-w>k')
map('n', '<S-l>', '<C-w>l')

local rightside = false
map('n', '<Tab>', function()
    if rightside then
        input('<C-w>h')
    else
        input('<C-w>l')
    end
    rightside = not rightside
end)

-- view highlight groups
map({'n', 'v'}, '<leader>ss', function()
    local groups = " "
    for _, val in pairs(vim.fn.synstack(vim.fn.line("."), vim.fn.col("."))) do
        groups = groups .. vim.fn.synIDattr(val, "name") .. " "
    end
    print(groups)
end)

