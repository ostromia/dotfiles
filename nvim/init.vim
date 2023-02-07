source ~/.config/nvim/vim-opts.vim
source ~/.config/nvim/vim-plug.vim

lua << EOF
require('keybindings')
require('theme')
require('theme-colors')
require('lsp')
EOF


" """ Conquer of Completion """
" " trigger autocomplete suggestion
" inoremap <silent><expr> <A-.> coc#refresh()
" " accept selected suggestion on enter
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

