local statusline = require("mini.statusline")

-- vim.o.laststatus = 3

statusline.setup({
    use_icons = false
})

-- {
--     use_icons = false,
--     content = {
--         active = function()
--             local mode, mode_hl = statusline.section_mode({})
--             local encoding = vim.bo.fileencoding ~= "" and vim.bo.fileencoding or vim.o.encoding

--             return statusline.combine_groups({
--                 { hl = mode_hl, strings = { mode, "%l:%v" } },
--                 { hl = "MiniStatuslineDevinfo", strings = {
--                     statusline.section_git({}),
--                     statusline.section_diagnostics({}),
--                     statusline.section_diff({}),
--                 } },
--                 "%<",
--                 { hl = "MiniStatuslineFilename", strings = { statusline.section_searchcount({}) } },
--                 "%=",
--                 { hl = "MiniStatuslineFileinfo", strings = { vim.bo.filetype, encoding, vim.bo.fileformat } },
--             })
--         end,
--     },
-- })
