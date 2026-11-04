$env.config.show_banner = false
$env.config.ls.use_ls_colors = false

$env.PROMPT_COMMAND = {|| $"(ansi purple)($env.PWD)(ansi reset)" }
$env.PROMPT_INDICATOR = " "
$env.PROMPT_COMMAND_RIGHT = ""

def --env icloud [] {
    cd $"($nu.home-dir)/Library/Mobile Documents/com~apple~CloudDocs"
}

use l.nu
use gitdirty.nu
use cheat.nu
use g.nu
use e.nu
