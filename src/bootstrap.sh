drive_name="${1}"
drive_client_id="${2}"
drive_client_secret="${3}"
drive_config_token="${4}"
atuin_username="${5}"
atuin_password="${6}"

printf "\x1b[1m🥾Starting bootstrap\x1b[0m\n"

script_path="$(readlink -f "${0}")"
src_path="$(dirname "${script_path}")"

. "${src_path}/set_ids.sh"
set_ids

. "${src_path}/utils.sh"
check_dependencies bzip2

printf "Creating directories\n"
. "${src_path}/create_dirs.sh"
create_dirs
touch "${HOME}/.hushlogin"
rm -rf "${HOME}/.bash_login"
rm -rf "${HOME}/.profile"

printf "Installing programs\n"
. "${src_path}/install_programs.sh"
install_programs

printf "Pulling configs\n"
. "${src_path}/pull_configs.sh"
pull_configs

printf "Connecting to Google Drive\n"
. "${src_path}/connect_drive.sh"
connect_drive "${drive_name}" "${drive_client_id}" "${drive_client_secret}" "${drive_config_token}"
-> fail+finish
-> success

printf "Pulling keys\n"
. "${src_path}/pull_keys.sh"
pull_keys "${drive_name}"

printf "Connecting to Atuin\n"
. "${src_path}/connect_atuin.sh"
connect_atuin "${atuin_username}" "${atuin_password}"

printf "\x1b[1mBootstrapping finished\x1b[0m\n"
