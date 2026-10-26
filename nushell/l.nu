def main [path: path = "."] {
    let entries = ls --all --short-names $path | sort-by type

    for i in ($entries | where type == dir | sort-by --ignore-case name) {
        print $"(ansi blue)($i.name)(ansi reset)"
    }

    for i in ($entries | where type != dir | sort-by --ignore-case name) {
        print $"(ansi white)($i.name)(ansi reset)"
    }
}

