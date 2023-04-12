require('nvim-tree').setup {
    sort_by = "type",

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
local map = vim.keymap.set
local input = vim.api.nvim_input

map('n', '<A-e>', function()
    local name = vim.api.nvim_buf_get_name(0)
    if string.find(name, 'NvimTree') then
        input('<C-w>l')
    else
        input(':NvimTreeFocus<CR>')
    end
end)

map('n', '<A-E>', ':NvimTreeToggle<CR>')
map('n', '<leader>ff', '<CMD>NvimTreeFindFile<CR>')

