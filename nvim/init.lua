local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({{ "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" }, { "\nPress any key to exit..." }}, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("options")

require('lazy').setup({
    -- theme
    "navarasu/onedark.nvim",
    "nvim-tree/nvim-web-devicons",

    -- workbench
    "nvim-tree/nvim-tree.lua",
    "romgrk/barbar.nvim",
    "nvim-lualine/lualine.nvim",

    -- other
    "junegunn/fzf",
    "numToStr/Comment.nvim",
    "norcalli/nvim-colorizer.lua",
})

require("keybindings")
require("theme")

