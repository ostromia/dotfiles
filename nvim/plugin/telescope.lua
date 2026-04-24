local telescope = require("telescope")
local builtin = require('telescope.builtin')

local mod = require("keybindings").mod

telescope.setup({
    extensions = {
        file_browser = {
            grouped = true,
            hidden = true,
        }
    }
})

vim.keymap.set("n", "<" .. mod .. "-o>", telescope.extensions.file_browser.file_browser)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)

local python_environment_state = false
local function python_environment()
    if python_environment_state then
        for _, name in ipairs({ "ruff", "ty" }) do
            for _, client in ipairs(vim.lsp.get_clients({ name = name })) do
                client:stop()
            end
        end
    else
        local root = vim.fn.getcwd()
        for _, name in ipairs({ "ruff", "ty" }) do
            local venv_bin = root .. "/.venv/bin/" .. name
            if vim.fn.executable(venv_bin) == 1 then
                vim.lsp.config(name, { cmd = { venv_bin, "server" } })
            end
            vim.lsp.enable(name)
        end
    end
    python_environment_state = not python_environment_state
end

local lsp_commands = {
    { name = "Python Environment", action = python_environment },
}

local function command_palette()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    pickers.new({}, {
        finder = finders.new_table({
            results = lsp_commands,
            entry_maker = function(entry)
                return { value = entry, display = entry.name, ordinal = entry.name }
            end,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(buf, map)
            actions.select_default:replace(function()
                local action = action_state.get_selected_entry().value.action
                actions.close(buf)
                vim.schedule(action)
            end)
            return true
        end,
    }):find()
end

vim.keymap.set("n", "<" .. mod .. "-p>", command_palette)

require("telescope").load_extension("file_browser")

