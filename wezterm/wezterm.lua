local wezterm = require('wezterm')
config = wezterm.config_builder and wezterm.config_builder() or {}


config.enable_scroll_bar = true
config.default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe", "-Login", "-NoLogo"  }

config.launch_menu = {
    {
        label = 'file explorer',
        args = { "vifm.exe"}
    },
    {
        label = 'powershell7',
        args = { "pwsh.exe", '--NoLogo' }
    },
    {
        label = 'WSL::Debian',
        args = { 'wsl.exe' }
    }
}

-- key bindings
config.keys = {
    { key = '`', mods = 'ALT', action = wezterm.action.ShowLauncher },
}

-- font
config.font_size = 9.5
config.font = wezterm.font('JetBrains Mono')
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

-- colors
config.colors = {
    tab_bar = {
        background = 'black',
        active_tab = { bg_color = 'black', fg_color = 'white' },
        inactive_tab = { bg_color = 'black', fg_color = 'grey' }
    }
}

-- window
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = { left = 0, bottom = 0, top = 0, right = 0 }

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


return config

