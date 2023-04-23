require('lualine').setup {
    options = {
        globalstatus = true,
        section_separators = '',
        component_separators = '',
    },
    sections = {
        lualine_a = {
            'mode',
            'location'
        },
        lualine_b = {
            'branch',
            'diagnostics',
            'diff'
        },
        lualine_c = {
            'searchcount'
        },
        lualine_x = {
            {
                'filetype',
                icons_enabled=false
            },
            'encoding',
            {
                'fileformat',
                icons_enabled=false
            },
        },
        lualine_y = {},
        lualine_z = {}
    }
}

