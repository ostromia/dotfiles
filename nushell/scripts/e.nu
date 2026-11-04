export def --wrapped main [...args] {
    let nvim = (which nvim | get 0.path)

    (^open -na Ghostty --args
        $"--config-file=($env.HOME)/.config/ghostty/editor"
        $"--working-directory=($env.PWD)"
        --quit-after-last-window-closed=true
        -e $nvim ...$args)
}
