local telescope = require("telescope")
local builtin = require('telescope.builtin')

telescope.setup({
    extensions = {
        file_browser = {
            grouped = true,
            hidden = true,
        }
    }
})

vim.keymap.set("n", "<D-o>", telescope.extensions.file_browser.file_browser)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)

require("telescope").load_extension("file_browser")

