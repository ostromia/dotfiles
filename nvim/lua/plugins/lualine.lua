require'lualine'.setup{
	options = {
		section_separators = '',
		component_separators = '',
	},
	
	sections = {
		lualine_a = {
			'mode'
		},

		lualine_b = {
			'branch', 'diff', 'diagnostics'
		},

		lualine_c = {
			{'filename', padding=1},
			{'filetype', icon_only = true, padding=0},
		},
		
		lualine_x = {
			'encoding',
			'fileformat',
			'filetype'
		},

		lualine_y = {},

		lualine_z = {
			'location'
		}
	}
}

