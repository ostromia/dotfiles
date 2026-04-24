vim.pack.add({
    "https://github.com/navarasu/onedark.nvim",

    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-telescope/telescope-file-browser.nvim",

    "https://github.com/nvim-lualine/lualine.nvim",

    "https://github.com/numToStr/Comment.nvim",
    "https://github.com/norcalli/nvim-colorizer.lua",

    "https://github.com/romus204/tree-sitter-manager.nvim"
})

require("options")
require("keybindings")
require("lsp")
require("treesitter")

require("theme")
