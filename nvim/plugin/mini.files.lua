local mod = require("keybindings").mod

local hidden = { [".DS_Store"] = true, [".git"] = true }
local show_hidden = false

local function filter(fs_entry)
    return show_hidden or not hidden[fs_entry.name]
end

require("mini.files").setup({
    content = { filter = filter },
})

vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesBufferCreate",
    callback = function(args)
        vim.keymap.set("n", "g.", function()
            show_hidden = not show_hidden
            MiniFiles.refresh({ content = { filter = filter } })
        end, { buffer = args.data.buf_id })
    end,
})

vim.keymap.set("n", "<" .. mod .. "-o>", function()
    if not MiniFiles.close() then MiniFiles.open() end
end)

