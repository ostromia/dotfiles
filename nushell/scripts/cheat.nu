const here = path self .

export def main [section: string] {
    let lines = open --raw ($here | path join cheat.md) | lines | each { str trim }

    mut current = ""

    for i in 0..<($lines | length) {
        let line = $lines | get $i

        if ($line | str starts-with "##") {
            $current = ($line | str substring 3.. | str trim)
        }

        if ($line | str ends-with ":") and $current == $section {
            let command = $lines | get ($i + 1) | str replace --all "`" "" | str trim
            let description = $line | str trim --right --char ":"
            print $"($command) # ($description)"
        }
    }
}
