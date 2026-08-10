vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

vim.o.swapfile = false

vim.o.termguicolors = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.opt.list = false
vim.opt.listchars = { eol = "$", tab = ">-", space = "·" }

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.signcolumn = "yes"
vim.o.numberwidth = 2

vim.opt.colorcolumn = { 80 }

vim.o.cursorline = true

vim.o.showmode = false

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function() vim.opt_local.formatoptions:remove({ "c", "r", "o" }) end
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*.typ",
    callback = function()
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.expandtab = true
    end
})

