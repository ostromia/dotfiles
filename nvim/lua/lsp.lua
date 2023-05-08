local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}
lspconfig.eslint.setup {}
lspconfig.pyright.setup {}
lspconfig.jedi_language_server.setup {}

local function nnoremap(lhs, rhs)
    vim.keymap.set('n', lhs, rhs, { noremap = true })
end

local function inoremap_expr(lhs, rhs)
    vim.keymap.set('i', lhs, rhs, { expr = true })
end

-- diagnostics keybindings
nnoremap('<leader>dd', '<CMD>lua vim.diagnostic.open_float()<CR>')
nnoremap('<leader>do', '<CMD>lua vim.diagnostic.setloclist()<CR>')
nnoremap('<leader>dj', '<CMD>lua vim.diagnostic.goto_next()<CR>')
nnoremap('<leader>dk', '<CMD>lua vim.diagnostic.goto_prev()<CR>')

-- toggle diagnostics virtual text
nnoremap('<leader>dv', function()
    vim.diagnostic.config({
        virtual_text = not vim.diagnostic.config()['virtual_text']
    })
end)

-- display hover information auto command
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', '<leader>ds', vim.lsp.buf.hover, { buffer = args.buf })
    end
})

-- use j and k for movement in completion popup
inoremap_expr('j', 'pumvisible() ? "<C-n>" : "j"')
inoremap_expr('k', 'pumvisible() ? "<C-p>" : "k"')

-- prevent newline on completion selection
inoremap_expr('<CR>', 'pumvisible() ? "<C-Y>" : "<CR>"')

-- prevent autocomplete vim-go split screen
vim.o.completeopt="menu"

-- completion menu keybinding
vim.keymap.set('i', '<A-s>', '<C-x><C-o>', { noremap = true })

