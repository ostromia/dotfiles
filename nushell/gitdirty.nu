def main [path: path = "."] {
    let folders = (
        ls --all --full-paths $path
        | where type == dir
        | where {|i| $i.name | path join .git | path exists }
        | get name
        | sort
    )

    let lines = $folders | par-each --keep-order {|folder|
        let name = $folder | path basename
        let dirty = ^git -C $folder status --porcelain | str trim | is-not-empty

        if $dirty {
            $"(ansi yellow)($name)(ansi reset)"
        } else {
            $name
        }
    }

    for i in $lines {
        print $i
    }
}
