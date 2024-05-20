local wezterm = require("wezterm")
config = wezterm.config_builder()
config.check_for_updates = false

config.default_prog = {"C:\\Program Files\\PowerShell\\7\\pwsh.exe", "-NoLogo"}
config.launch_menu = {
    { label = "pwsh.exe", args = { "pwsh.exe", "-NoLogo" } },
    { label = "wsl.exe",  args = { "wsl.exe" }             }
}

-- key bindings
config.keys = {
    { key = "p", mods = "ALT", action = wezterm.action.ActivateCommandPalette },
}

for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "ALT",
    action = wezterm.action.ActivateTab(i - 1),
  })
end

-- general font
config.font_size = 9.5
config.font = wezterm.font("JetBrains Mono")
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- general colors
config.colors = {
    tab_bar = {
        background = "black",
        active_tab = { bg_color = "black", fg_color = "white" },
        inactive_tab = { bg_color = "black", fg_color = "grey" }
    }
}

-- window
config.window_close_confirmation = "NeverPrompt"
config.window_padding = { left = 0, bottom = 0, top = 0, right = 0 }

-- tab bar
config.show_tabs_in_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = true

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    return { { Text = " " .. tab.active_pane.title .. " " } }    
end)

-- scrollbar
config.enable_scroll_bar = true

return config

