const here = path self .

def accounts [] {
    open ($here | path join accounts.toml)
}

def "nu-complete accounts" [] {
    accounts | columns
}

export def account [user: string@"nu-complete accounts"] {
    let account = accounts | get $user
    ^gh auth switch --user $user
    $account | items {|key, value| ^git config --global $"user.($key)" $value } | ignore
}
