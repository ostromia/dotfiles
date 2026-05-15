# cheat

## brew

show dependencies for leaves as a tree:
`brew deps --tree $(brew leaves)`

list outdated leaves:
`brew outdated --quiet | grep -Fxf <(brew leaves)`

upgrade outdated formula:
`brew upgrade --formula [<name>]`

list outdated casks:
`brew outdated --cask`

upgrade outdated casks:
`brew upgrade --cask [<name>]`

## 7zz

encrypt:
`7zz a -p -mhe=on <destination> <target>`

decrypt:
`7zz x <target>`

