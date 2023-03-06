let g:loaded_netrw=1
let g:loaded_netrwPlugin=1
let g:loaded_python3_provider=0
let g:loaded_pythonx_provider=0
let g:python_recommended_style=0

source ~/.config/nvim/vim-opts.vim
source ~/.config/nvim/vim-plug.vim

lua << EOF
require('keybindings')
require('theme')
require('theme-colors')
require('lsp')
EOF
