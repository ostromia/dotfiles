require('nvim-tree').setup {
    sort = {
        sorter = "filetype"
    },

    view = {
        width = 20,
        adaptive_size = true,
        signcolumn = "yes"
    },

    actions = {
        open_file = {
            resize_window = true
        }
    },

    renderer = {
        indent_width = 2,
        icons = {
            git_placement = "after",
            show = {
                file = false,
                folder = false,
                folder_arrow = false,
                git = true
            }
        },
        special_files = {}
    }
}

-- keybindings
vim.keymap.set('n', '<D-e>', function()
    local name = vim.api.nvim_buf_get_name(0)
    if string.find(name, 'NvimTree') then
        vim.api.nvim_input('<C-w>l')
    else
        vim.api.nvim_input(':NvimTreeFocus<CR>')
    end
end)

vim.keymap.set('n', '<D-E>', ':NvimTreeToggle<CR>')
