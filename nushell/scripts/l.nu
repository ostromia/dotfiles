export def main [path: path = "."] {
    let entries = ls --all --short-names $path
    let dirs = $entries | where type == dir | sort-by --ignore-case name | get name
    let files = $entries | where type != dir and type != symlink | sort-by --ignore-case name | get name
    let links = $entries | where type == symlink | sort-by --ignore-case name | get name
    let dir_width = $dirs | each { str length } | append 0 | math max
    let file_width = $files | each { str length } | append 0 | math max
    let rows = [($dirs | length) ($files | length) ($links | length)] | math max

    for i in 0..<$rows {
        let dir = $dirs | get --optional $i | default "" | fill --width $dir_width
        let file = $files | get --optional $i | default "" | fill --width $file_width
        let link = $links | get --optional $i | default ""
        print $"(ansi blue)($dir)(ansi reset)  (ansi white)($file)(ansi reset)  (ansi cyan)($link)(ansi reset)"
    }
}
