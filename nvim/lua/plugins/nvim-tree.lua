local map = vim.keymap.set
local input = vim.api.nvim_input

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  actions = {
    open_file = {
      resize_window = true
    }
  },
  
  view = {
		width = 20,
    adaptive_size = true
  },

  renderer = {
		indent_width = 2,
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = true
      }
    }
  }
})

map('n', '<A-e>', function()
	local name = vim.api.nvim_buf_get_name(0)
	if string.find(name, 'NvimTree') then
		input('<C-w>l')
	else
		input(':NvimTreeFocus<CR>')
	end
end)

map('n', '<A-E>', function()
	local name = vim.api.nvim_buf_get_name(0)
	if string.find(name, 'NvimTree') then
		input(':NvimTreeClose<CR>')
	else
		input(':NvimTreeToggle<CR>')
	end
end)

