function pull_configs(){

    PATH="${HOME}/.local/bin:${PATH}"
    export MAMBA_EXE="$(type -P "micromamba")"
    export MAMBA_ROOT_PREFIX="${HOME}/micromamba"
    eval "$(micromamba shell hook --shell "bash")"
    micromamba activate

    (
        cd "${HOME}"

        # .bash_profile
        gdown "https://drive.google.com/file/d/1wy6Pk8BHd_IPZOlDHDV3DqY3kOXytMzd/view?usp=sharing"
        # .bashrc
        gdown "https://drive.google.com/file/d/100z8qv0rgKK0jcJY7DwmyVeECFEDlx9P/view?usp=sharing"
        # .blerc
        gdown "https://drive.google.com/file/d/13Hwo8vRJNNyVAopGYKIvs-RJHfUzNqlF/view?usp=sharing"
        # .condarc
        gdown "https://drive.google.com/file/d/1GW0pMDSG7AR0YcEN19qxuJLnf6ogzNdI/view?usp=sharing"
        # .gitconfig
        gdown "https://drive.google.com/file/d/1bV9GT4um_0RpDxLIdjkZ-7Q8cMk6BJ6U/view?usp=sharing"
    )

    mkdir "${HOME}/.ssh"
    (
        cd "${HOME}/.ssh"

        # config
        gdown "https://drive.google.com/file/d/1u94i3xI0keixo3e1Lfv_ZFMrWLFUh7bm/view?usp=sharing"
    )

    mkdir "${HOME}/.config/atuin"
    (
        cd "${HOME}/.config/atuin"

        # config.toml
        gdown "https://drive.google.com/file/d/1kTmVir92aSdbOdO34yivE5KOBJz2_681/view?usp=sharing" -O config.toml
    )

    mkdir "${HOME}/.config/zellij"
    (
        cd "${HOME}/.config/zellij"

        # config.kdl
        gdown "https://drive.google.com/file/d/1-RRfDjOVctimSTZkCOstZdPQ-RqxT6m4/view?usp=sharing"
    )

    if [ "${os}" = "Linux" ]; then
        mkdir "${HOME}/.config/btop"
        (
            cd "${HOME}/.config/btop"

            # btop.conf
            gdown "https://drive.google.com/file/d/1jogoEZ2ioyw86j3b5RkH3qrS_1MOs-YC/view?usp=sharing"
        )
    fi

    mkdir -p "${HOME}/.ipython/profile_default"
    (
        cd "${HOME}/.ipython/profile_default"

        # ipython_config.py
        gdown "https://drive.google.com/file/d/1ZX7EflGFNWB-0Ni5WgKfVHH9WRQqOAQh/view?usp=sharing" 
    )

    mkdir "${HOME}/.codex"
    (
        cd "${HOME}/.codex"

        # config.toml
        gdown "https://drive.google.com/file/d/1s4lAvTXG9gYrq2RkqIaBkrg2_ayAim9y/view?usp=sharing" -O config.toml
    )

    mkdir "${HOME}/.claude"
    (
        cd "${HOME}/.claude"

        # settings.json
        gdown "https://drive.google.com/file/d/1YAD7h5sxReo5xaw5rKxJn5FemIYINeBp/view?usp=sharing"
    )
}
