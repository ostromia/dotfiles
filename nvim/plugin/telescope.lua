local telescope = require("telescope")
telescope.builtin = require("telescope.builtin")
telescope.pickers = require("telescope.pickers")
telescope.finders = require("telescope.finders")
telescope.config = require("telescope.config")
telescope.actions = require("telescope.actions")
telescope.action_state = require("telescope.actions.state")

local mod = require("keybindings").mod
local lsp = require("lsp")

telescope.setup({
    extensions = {
        file_browser = {
            grouped = true,
            hidden = true,
        }
    }
})

vim.keymap.set("n", "<" .. mod .. "-o>", telescope.extensions.file_browser.file_browser)
vim.keymap.set('n', '<leader>fg', telescope.builtin.live_grep)
vim.keymap.set('n', '<leader>fb', telescope.builtin.buffers)
vim.keymap.set('n', '<leader>fh', telescope.builtin.help_tags)

local commands = {
    { name = "Language Server Protocol", action = lsp.toggle },
}

local function command_palette()
    telescope.pickers.new({}, {
        finder = telescope.finders.new_table({
            results = commands,
            entry_maker = function(entry)
                return { value = entry, display = entry.name, ordinal = entry.name }
            end
        }),
        sorter = telescope.config.values.generic_sorter({}),
        attach_mappings = function(buffer, _)
            telescope.actions.select_default:replace(function()
                telescope.actions.close(buffer)
                vim.schedule(telescope.action_state.get_selected_entry().value.action)
            end)
            return true
        end,
    }):find()
end

vim.keymap.set("n", "<" .. mod .. "-p>", command_palette)

require("telescope").load_extension("file_browser")

