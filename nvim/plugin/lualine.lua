require('lualine').setup {
    options = {
        globalstatus = true,

        section_separators = '',
        component_separators = '',

        disabled_filetypes = {
            statusline = {}
        }
    },

    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},

        lualine_x = {
            'filetype',
            'encoding',
            'fileformat'
        },

        lualine_y = {
            'diagnostics',
            'branch',
            'diff'
        },

        lualine_z = {
            'location',
            'mode'
        }
    }
}

