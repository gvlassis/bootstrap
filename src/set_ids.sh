# Sets the locations of the architecture-dependent programs
function set_ids(){
    os="$(uname)"

    if [ "${os}" = "Darwin" ]; then
        printf "\x1b[32mmacOS (supported) detected\x1b[0m\n"
        atuin_id="https://drive.google.com/file/d/1-Sp4DyzRwxUX40liF3_aEZ0UsASWWUks/view?usp=drive_link"
        catimg_id="https://drive.google.com/file/d/186-7bRN6FYlYnj2CI3tdHefVnnlboJ2j/view?usp=drive_link"
        micromamba_id="osx-arm64"
        nnn_id="https://drive.google.com/file/d/1zEWOUu8GDRPRQGek4qmioVMdpgJk2-lS/view?usp=drive_link"
        rclone_id="osx-arm64"
        zellij_id="aarch64-apple-darwin"
        neovim_id="https://drive.google.com/file/d/1zjs9k2Sf8Q_BrJ5Wpq__a3R2__TfmZVC/view?usp=drive_link"
    elif [ "${os}" = "Linux" ]; then
        local arch="$(uname -m)"
        if [ "${arch}" = "x86_64" ]; then
            printf "\x1b[32mLinux-Intel (supported) detected\x1b[0m\n"
            atuin_id="https://drive.google.com/file/d/1vzDY0l2qKZ3AulG3Ik9CvkKgd8cZklwc/view?usp=drive_link"
            catimg_id="https://drive.google.com/file/d/1-1s-ma6thJmrh8Pp-9q25TFjex6A82m5/view?usp=drive_link"
            micromamba_id="linux-64"
            nnn_id="https://drive.google.com/file/d/1kJqB77VcYj9pwcrXTAWs3gThIRHQzT6j/view?usp=drive_link"
            rclone_id="linux-amd64"
            zellij_id="x86_64-unknown-linux-musl"
            btop_id="https://drive.google.com/file/d/1hQN48E3qfNP-S7VAkEL_IJLjTVxBsnNi/view?usp=drive_link"
            neovim_id="https://drive.google.com/file/d/1KVVzTw1FIwimk_pGnj_hUmamzgCe7KG6/view?usp=drive_link"
        elif [ "${arch}" = "aarch64" ]; then
            printf "\x1b[32mLinux-Arm (supported) detected\x1b[0m\n"
            atuin_id="https://drive.google.com/file/d/1WS5lrtMKeQPpG-kxFqlAMPVABVTlH5qh/view?usp=drive_link"
            catimg_id="https://drive.google.com/file/d/1IhDy5xwXMwTTQZpYGZ7PkOWV5lRedzsv/view?usp=drive_link"
            micromamba_id="linux-aarch64"
            nnn_id="https://drive.google.com/file/d/1nv8LDZ2rDqNRyieAZG4MWjo8jZahDZ4a/view?usp=drive_link"
            rclone_id="linux-arm64"
            zellij_id="aarch64-unknown-linux-musl"
            btop_id="https://drive.google.com/file/d/1WFTbLcg9JqR_T5mFabB6-8xuURbimFVT/view?usp=drive_link"
            neovim_id="https://drive.google.com/file/d/16VWfIrIJDVXU3NKzIVZkXy9MX8KeiEZg/view?usp=drive_link"
        fi
    fi
}
