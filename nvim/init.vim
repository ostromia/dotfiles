set noswapfile

set number
set relativenumber

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set nolist
set listchars=eol:$,tab:>-,space:·

set colorcolumn=79
set signcolumn=no

set termguicolors

set nowrap

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
call plug#end()


lua << EOF
require('keybindings')
require('theme')
EOF

