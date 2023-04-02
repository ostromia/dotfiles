require('nvim-treesitter.configs').setup {
    ensure_installed = {'c', 'lua', 'vim', 'query'},
    auto_install = false,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm'
        }
    },

    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            include_surrounding_whitespace = false,
            keymaps = {
                ['ab'] = '@block.outer',
                ['ib'] = '@block.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            }
        },
        move = {
            enable = true,
            goto_next_start = {
                [']f'] = '@function.outer',
                [']c'] = '@class.outer'
            },
            goto_previous_start = {
                ['[f'] = '@function.outer',
                ['[c'] = '@class.outer'
            }
        }
    }
}

-- keybindings
local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, "'", ts_repeat_move.repeat_last_move_previous)

