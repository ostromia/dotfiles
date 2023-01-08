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

" set laststatus=3

set termguicolors

call plug#begin()
" theme
Plug 'navarasu/onedark.nvim'
Plug 'nvim-tree/nvim-web-devicons'

" workbench
Plug 'nvim-tree/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/toggleterm.nvim'

" treesitter & dependent plugins
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" other
Plug 'junegunn/fzf'
Plug 'numToStr/Comment.nvim'

" Plug 'koenverburg/cmd-palette.nvim'
" Plug 'stevearc/dressing.nvim'
" Plug 'othree/html5.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neovim/nvim-lspconfig'
" Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" Plug 'nvim-lua/plenary.nvim'
" Plug 'folke/neodev.nvim'
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
" Plug 'neovim/nvim-lspconfig'
call plug#end()

lua << EOF
require('plugins')
require('keybindings')
require('colorscheme')
require('lsp')
EOF

