function connect_atuin(){
    local atuin_username="${1}"
    local atuin_password="${2}"

    PATH="${HOME}/.local/bin:${PATH}"

    if atuin status | grep "Remote" &> "/dev/null"; then
        printf "\x1b[32mSuccess :)\x1b[0m\n"
    else
        atuin login -u "${atuin_username}" -k "" -p "${atuin_password}" &> "/dev/null"

        if atuin status | grep "Remote" &> "/dev/null"; then
            printf "\x1b[32mSuccess :)\x1b[0m\n"
        else
            printf "\x1b[31mFailure :(\x1b[0m\n"
            exit 2
        fi
    fi
}
