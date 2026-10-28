$env.config.show_banner = false

$env.PROMPT_COMMAND = {|| $"(ansi purple)($env.PWD)(ansi reset)" }
$env.PROMPT_INDICATOR = " "
$env.PROMPT_COMMAND_RIGHT = ""

def --env icloud [] {
    cd $"($nu.home-dir)/Library/Mobile Documents/com~apple~CloudDocs"
}

alias l = nu --no-config-file ~/.config/nushell/l.nu
alias gitdirty = nu --no-config-file ~/.config/nushell/gitdirty.nu
alias cheat = nu --no-config-file ~/.config/nushell/cheat.nu
