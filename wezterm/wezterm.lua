local wezterm = require('wezterm')

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.colors = {
    tab_bar = {
        background = 'black',
        active_tab = { bg_color = 'black', fg_color = 'white' },
        inactive_tab = { bg_color = 'black', fg_color = 'grey' }
    }
}

-- tab bar
config.show_tabs_in_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    return { { Text = ' ' .. tab.active_pane.title .. ' ' } }    
end)

config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}

config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.skip_close_confirmation_for_processes_named = {
    'bash',
    'sh',
    'zsh',
    'fish',
    'tmux',
    'nu',
    'cmd.exe',
    'pwsh.exe',
    'powershell.exe',
}


config.keys = {
    { key = '`', mods = 'ALT', action = wezterm.action.ShowLauncher },
}

config.enable_scroll_bar = true
config.font_size = 9.5
config.default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe", '-l' }

return config
