-- https://github.com/nshern/neovim-default-colorscheme-extras

local colors = {
    NvimLightBlue = "#A6DBFF",
    NvimLightGreen = "#B4F6C0",
    NvimLightMagenta = "#FFCAFF",
    NvimLightGrey1 = "#EEF1F8",
    NvimLightRed = "#FFC0B9",
    NvimLightYellow = "#FCE094",
    NvimDarkGrey4 = "#4f5258"
}

vim.api.nvim_set_hl(0, "@variable", { fg = colors.NvimLightGrey1 })
vim.api.nvim_set_hl(0, "@variable.builtin", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@variable.parameter", { fg = colors.NvimLightGrey1 })
vim.api.nvim_set_hl(0, "@variable.parameter.builtin", { fg = colors.NvimLightMagenta })

vim.api.nvim_set_hl(0, "@constant", { fg = colors.NvimLightRed })
vim.api.nvim_set_hl(0, "@constant.builtin", { fg = colors.NvimLightRed })
vim.api.nvim_set_hl(0, "@constant.macro", { fg = colors.NvimLightRed })

vim.api.nvim_set_hl(0, "@module", { fg = colors.NvimLightGrey1 })
vim.api.nvim_set_hl(0, "@module.builtin", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@label", { fg = colors.NvimLightGrey1 })

vim.api.nvim_set_hl(0, "@string", { fg = colors.NvimLightGreen })
vim.api.nvim_set_hl(0, "@string.documentation", { fg = colors.NvimLightGreen })
vim.api.nvim_set_hl(0, "@string.regexp", { fg = colors.NvimLightGreen })
vim.api.nvim_set_hl(0, "@string.escape", { fg = colors.NvimLightGreen })
vim.api.nvim_set_hl(0, "@string.special", { fg = colors.NvimLightGreen })
vim.api.nvim_set_hl(0, "@string.special.symbol", { fg = colors.NvimLightGreen })
vim.api.nvim_set_hl(0, "@string.special.path", { fg = colors.NvimLightGreen })
vim.api.nvim_set_hl(0, "@string.special.url", { fg = colors.NvimLightGreen })

vim.api.nvim_set_hl(0, "@character", { fg = colors.NvimLightGrey1 })
vim.api.nvim_set_hl(0, "@character.special", { fg = colors.NvimLightGrey1 })

vim.api.nvim_set_hl(0, "@boolean", { fg = colors.NvimLightGrey1 })
vim.api.nvim_set_hl(0, "@number", { fg = colors.NvimLightGrey1 })
vim.api.nvim_set_hl(0, "@number.float", { fg = colors.NvimLightGrey1 })

vim.api.nvim_set_hl(0, "@type", { fg = colors.NvimLightYellow })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = colors.NvimLightYellow })
vim.api.nvim_set_hl(0, "@type.definition", { fg = colors.NvimLightYellow })

vim.api.nvim_set_hl(0, "@attribute", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@attribute.builtin", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@property", { fg = colors.NvimLightGrey1 })

vim.api.nvim_set_hl(0, "@function", { fg = colors.NvimLightGrey1 })
vim.api.nvim_set_hl(0, "@function.builtin", { fg = colors.NvimLightBlue })
vim.api.nvim_set_hl(0, "@function.call", { fg = colors.NvimLightGrey1 })
vim.api.nvim_set_hl(0, "@function.macro", { fg = colors.NvimLightGrey1 })
vim.api.nvim_set_hl(0, "@function.method", { fg = colors.NvimLightGrey1 })
vim.api.nvim_set_hl(0, "@function.method.call", { fg = colors.NvimLightGrey1 })
vim.api.nvim_set_hl(0, "@constructor", { fg = colors.NvimLightGrey1 })
vim.api.nvim_set_hl(0, "@operator", { fg = colors.NvimLightGrey1 })

vim.api.nvim_set_hl(0, "@keyword", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@keyword.coroutine", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@keyword.function", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@keyword.operator", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@keyword.import", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@keyword.type", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@keyword.modifier", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@keyword.return", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@keyword.debug", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@keyword.exception", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@keyword.conditional.ternary", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@keyword.directive", { fg = colors.NvimLightMagenta })
vim.api.nvim_set_hl(0, "@keyword.directive.define", { fg = colors.NvimLightMagenta })

vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = colors.NvimLightGrey1 })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = colors.NvimLightGrey1 })
vim.api.nvim_set_hl(0, "@punctuation.special", { fg = colors.NvimLightGrey1 })

vim.api.nvim_set_hl(0, "@comment", { fg = colors.NvimDarkGrey4 })
vim.api.nvim_set_hl(0, "@comment.documentation", { fg = colors.NvimDarkGrey4 })
vim.api.nvim_set_hl(0, "@comment.error", { fg = colors.NvimDarkGrey4 })
vim.api.nvim_set_hl(0, "@comment.warning", { fg = colors.NvimDarkGrey4 })
vim.api.nvim_set_hl(0, "@comment.todo", { fg = colors.NvimDarkGrey4 })
vim.api.nvim_set_hl(0, "@comment.note", { fg = colors.NvimDarkGrey4 })

