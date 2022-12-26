set noswapfile

set number
set relativenumber

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set colorcolumn=79

set laststatus=3

call plug#begin()
Plug 'navarasu/onedark.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-lua/plenary.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'folke/neodev.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'vimpostor/vim-tpipeline'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
call plug#end()

:lua require('plugins')
:lua require('keybindings')
:lua require('theme')

