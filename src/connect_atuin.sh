function connect_atuin(){
    local atuin_username="${1}"
    local atuin_password="${2}"
    local atuin_key="${3}"

    PATH="${HOME}/.local/bin:${PATH}"

    atuin login -u "${atuin_username}" -p "${atuin_password}" -k "${atuin_key}"

    atuin sync
}
