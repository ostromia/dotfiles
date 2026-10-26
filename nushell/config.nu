$env.config.show_banner = false

$env.PROMPT_COMMAND = {||
    let dir = ($env.PWD | str replace $nu.home-dir '~')
    $"(ansi -e {fg: '#ffffff', bg: '#4b3a6e'}) ($dir) "
}

$env.PROMPT_INDICATOR = {||
    $"(ansi -e {fg: '#ffffff', bg: '#4b3a6e'})(ansi -e 'K')"
}

$env.PROMPT_COMMAND_RIGHT = ""

$env.config.hooks.pre_execution = [{||
    let cmd = (commandline)
    let dir = ($env.PWD | str replace $nu.home-dir '~')
    let style = (ansi -e {fg: '#ffffff', bg: '#4b3a6e'})
    print -n $"(ansi -e '1A')\r($style) ($dir) ($cmd)(ansi -e 'K')(ansi reset)\n"
}]

alias l = nu --no-config-file ~/.config/nushell/l.nu
