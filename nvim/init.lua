require("options")
require("keybindings")

vim.pack.add({
    "https://github.com/navarasu/onedark.nvim",
    
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-telescope/telescope-file-browser.nvim",

    "https://github.com/nvim-lualine/lualine.nvim",

    "https://github.com/numToStr/Comment.nvim",
    "https://github.com/norcalli/nvim-colorizer.lua",
})

require("theme")

vim.lsp.enable('ruff')
vim.lsp.enable('ty')

