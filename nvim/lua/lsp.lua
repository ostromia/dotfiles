local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}
lspconfig.eslint.setup {}
lspconfig.pyright.setup {}
lspconfig.jedi_language_server.setup {}

-- use j and k for movement in completion popup
vim.keymap.set('i', 'j', 'pumvisible() ? "<C-n>" : "j"', { expr = true })
vim.keymap.set('i', 'k', 'pumvisible() ? "<C-p>" : "k"', { expr = true })
-- prevent newline on completion selection
vim.keymap.set('i', '<CR>', 'pumvisible() ? "<C-Y>" : "<CR>"', { expr = true })
-- Prevent autocomplete vim-go split screen
vim.o.completeopt="menu"

local function nmap(lhs, rhs)
    vim.keymap.set('n', lhs, rhs, {noremap = true})
end

nmap('<leader>dd', '<CMD>lua vim.diagnostic.open_float()<CR>')
nmap('<leader>do', '<CMD>lua vim.diagnostic.setloclist()<CR>')
nmap('<leader>dj', '<CMD>lua vim.diagnostic.goto_next()<CR>')
nmap('<leader>dk', '<CMD>lua vim.diagnostic.goto_prev()<CR>')

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', '<leader>ds', vim.lsp.buf.hover, { buffer = args.buf })
    end,
})

vim.keymap.set('n', '<leader>dv', function()
    vim.diagnostic.config({
        virtual_text = not vim.diagnostic.config()['virtual_text']
    })
end, {noremap=true})

