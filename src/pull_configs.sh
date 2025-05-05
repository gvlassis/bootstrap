function pull_configs(){

    PATH="${HOME}/.local/bin:${PATH}"
    export MAMBA_EXE="$(type -P "micromamba")"
    export MAMBA_ROOT_PREFIX="${HOME}/micromamba"
    eval "$(micromamba shell hook --shell "bash")"
    micromamba activate

    (
        cd "${HOME}"

        # .bash_profile
        gdown --fuzzy "https://drive.google.com/file/d/1wy6Pk8BHd_IPZOlDHDV3DqY3kOXytMzd/view?usp=sharing" &> "/dev/null"
        # .bashrc
        gdown --fuzzy "https://drive.google.com/file/d/100z8qv0rgKK0jcJY7DwmyVeECFEDlx9P/view?usp=sharing" &> "/dev/null"
        # .blerc
        gdown --fuzzy "https://drive.google.com/file/d/13Hwo8vRJNNyVAopGYKIvs-RJHfUzNqlF/view?usp=sharing" &> "/dev/null"
        # .condarc
        gdown --fuzzy "https://drive.google.com/file/d/1GW0pMDSG7AR0YcEN19qxuJLnf6ogzNdI/view?usp=sharing" &> "/dev/null"
        # .gitconfig
        gdown --fuzzy "https://drive.google.com/file/d/1bV9GT4um_0RpDxLIdjkZ-7Q8cMk6BJ6U/view?usp=sharing" &> "/dev/null"
    )

    mkdir "${HOME}/.ssh" &> "/dev/null"
    (
        cd "${HOME}/.ssh"

        # config
        gdown --fuzzy "https://drive.google.com/file/d/1u94i3xI0keixo3e1Lfv_ZFMrWLFUh7bm/view?usp=sharing" &> "/dev/null"
    )

    mkdir "${HOME}/.config/atuin" &> "/dev/null"
    (
        cd "${HOME}/.config/atuin"

        # config.toml
        gdown --fuzzy "https://drive.google.com/file/d/1OWHbmENvfx-RNvxYJUL51WLzt5UoSVWi/view?usp=sharing" &> "/dev/null"
    )

    mkdir "${HOME}/.config/zellij" &> "/dev/null"
    (
        cd "${HOME}/.config/zellij"

        # config.kdl
        gdown --fuzzy "https://drive.google.com/file/d/1-RRfDjOVctimSTZkCOstZdPQ-RqxT6m4/view?usp=sharing" &> "/dev/null"
    )

    if [ "${os}" = "Linux" ]; then
        mkdir "${HOME}/.config/btop" &> "/dev/null"
        (
            cd "${HOME}/.config/btop"

            # btop.conf
            gdown --fuzzy "https://drive.google.com/file/d/1jogoEZ2ioyw86j3b5RkH3qrS_1MOs-YC/view?usp=sharing" &> "/dev/null"
        )
    fi

    mkdir -p "${HOME}/.ipython/profile_default" &> "/dev/null"
    (
        cd "${HOME}/.ipython/profile_default"

        # ipython_config.py
        gdown --fuzzy "https://drive.google.com/file/d/1ZX7EflGFNWB-0Ni5WgKfVHH9WRQqOAQh/view?usp=sharing" &> "/dev/null"
    )
}
