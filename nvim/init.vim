source ~/.config/nvim/vim-opts.vim
source ~/.config/nvim/vim-plug.vim

lua << EOF
require('keybindings')
require('theme')
require('theme-colors')
require('lsp')
EOF

