let g:loaded_netrw=1
let g:loaded_netrwPlugin=1
let g:loaded_python3_provider=0
let g:python_recommended_style=0

set noswapfile

set number
set relativenumber

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set nolist
set listchars=eol:$,tab:>-,space:·

set signcolumn=yes
set numberwidth=2
set colorcolumn=79

set termguicolors

set nowrap

set cursorline

autocmd FileType * setlocal formatoptions-=cro

call plug#begin()
" theme
Plug 'navarasu/onedark.nvim'
Plug 'nvim-tree/nvim-web-devicons'

" workbench
Plug 'nvim-tree/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'

" other
Plug 'junegunn/fzf'
Plug 'numToStr/Comment.nvim'
Plug 'norcalli/nvim-colorizer.lua'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" lsp & linters
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-lint'
call plug#end()


lua << EOF
require('keybindings')
require('theme')
if vim.loop.os_uname().sysname == 'Linux' then
    require('lsp')
end
EOF

