-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disable python stuff
vim.g.loaded_python3_provider = 0
vim.g.python_recommended_style = 0

-- set options
vim.o.swapfile = false

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.list = false
vim.o.listchars = "eol:$,tab:>-,space:·"

vim.wo.signcolumn = "yes"
vim.wo.numberwidth = 2
vim.o.colorcolumn = "79"

vim.o.termguicolors = true

vim.o.wrap = false

vim.wo.cursorline = true

vim.o.showmode = false

-- autocommand to adjust formatoptions for all file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "setlocal formatoptions-=cro",
})
