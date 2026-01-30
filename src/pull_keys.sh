function pull_keys(){
    local name="${1}"

    PATH="${HOME}/.local/bin:${PATH}"

    mkdir "${HOME}/.ssh"
    rclone sync ${name}:Keys "${HOME}/.ssh" --include "{id_rsa.pub,id_rsa,id_dsa.pub,id_dsa,id_ecdsa.pub,id_ecdsa,id_ed25519.pub,id_ed25519}"
    # SSH keys require specific permissions
    chmod 600 "${HOME}/.ssh/id_rsa" "${HOME}/.ssh/id_dsa" "${HOME}/.ssh/id_ecdsa" "${HOME}/.ssh/id_ed25519"

    # mkdir "${HOME}/.local/share/atuin"
    # rclone sync ${name}:Keys "${HOME}/.local/share/atuin" --include "key"

    mkdir "${HOME}/.codex"
    rclone sync ${name}:Keys "${HOME}/.codex" --include "auth.json"
}
