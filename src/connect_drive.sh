function connect_drive(){
    local drive_name="${1}"
    local drive_client_id="${2}"
    local drive_client_secret="${3}"
    # The whole JSON token, not the "access_token"
    local drive_config_token="${4}"
    
    PATH="${HOME}/.local/bin:${PATH}"

    rclone config create "${drive_name}" drive client_id="${drive_client_id}" client_secret="${drive_client_secret}" scope=drive config_is_local=false config_token="${drive_config_token}" config_change_team_drive=false
}
