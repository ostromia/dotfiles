local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}
lspconfig.eslint.setup {}

local function nmap(lhs, rhs)
    vim.keymap.set('n', lhs, rhs, {noremap = true})
end

nmap('<leader>dd', '<CMD>lua vim.diagnostic.open_float()<CR>')
nmap('<leader>do', '<CMD>lua vim.diagnostic.setloclist()<CR>')
nmap('<leader>dj', '<CMD>lua vim.diagnostic.goto_next()<CR>')
nmap('<leader>dk', '<CMD>lua vim.diagnostic.goto_prev()<CR>')

-- toggle diagnostic virtual text
vim.keymap.set('n', '<leader>dv', function()
    vim.diagnostic.config({
        virtual_text = not vim.diagnostic.config()['virtual_text']
    })
end, {noremap=true})

