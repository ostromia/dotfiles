source ~/.config/nvim/vim-opts.vim
source ~/.config/nvim/vim-plug.vim

lua << EOF
require('keybindings')
require('theme')
require('theme-colors')
require('lsp')
EOF

let mapleader = " "
nmap <leader>ss :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

