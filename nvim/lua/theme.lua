-- :h treesitter-highlight-groups
-- ~/.local/share/nvim/plugged/onedark.nvim/lua/onedark/palette.lua

require('nvim-web-devicons').setup {}

require('onedark').setup {
  style = 'dark',
  
  code_style = { comments = 'none' },

  highlights = {
    ['@parameter'] = {fg = '$fg'},
    ['foldBraces'] = {fg = '$fg'},

    -- svelte
    ['svelteComponentName'] = {fg = '$yellow'},
    ['svelteBrace'] = {fg = '$purple'},

    -- html
    ['htmlTag'] = {fg = '$fg'},
    ['htmlEndTag'] = {fg = '$fg'},
    ['htmlTagName'] = {fg = '$red'},
    ['htmlTagN'] = {fg = '$red'},
    ['htmlArg'] = {fg = '$orange'},

    -- javascript
    ['javaScriptBraces'] = {fg = '$fg'},
    ['javaScriptFunction'] = {fg = '$purple'},

    -- typescript
    ['typescriptStorageClass'] = {fg = '$purple'},
    ['typescriptParens'] = {fg = '$fg'},
    ['typescriptBraces'] = {fg = '$fg'},
    ['typescriptEndColons'] = {fg = '$fg'},

    -- sass
    ['sassClass'] = {fg = '$orange'},
    ['sassClassChar'] = {fg = '$orange'},
    ['sassProperty'] = {fg = '$fg'},

    ['cssUIAttr'] = {fg = '$orange'},
    ['cssFlexibleBoxAttr'] = {fg = '$orange'},

    ['cssKeyFrameProp2'] = {fg = '$orange'},
    ['cssValueLength'] = {fg = '$orange'},
    ['cssValueTime'] = {fg = '$orange'},
  }
}
require('onedark').load()

