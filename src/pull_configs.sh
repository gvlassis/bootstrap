function pull_configs(){

    PATH="${HOME}/.local/bin:${PATH}"

    (
        cd "${HOME}"

        # .bash_profile
        goodls -u "https://drive.google.com/file/d/1wy6Pk8BHd_IPZOlDHDV3DqY3kOXytMzd/view?usp=sharing" &> "/dev/null"
        # .bashrc
        goodls -u "https://drive.google.com/file/d/100z8qv0rgKK0jcJY7DwmyVeECFEDlx9P/view?usp=sharing" &> "/dev/null"
        # .blerc
        goodls -u "https://drive.google.com/file/d/13Hwo8vRJNNyVAopGYKIvs-RJHfUzNqlF/view?usp=sharing" &> "/dev/null"
        # .condarc
        goodls -u "https://drive.google.com/file/d/1GW0pMDSG7AR0YcEN19qxuJLnf6ogzNdI/view?usp=sharing" &> "/dev/null"
        # .gitconfig
        goodls -u "https://drive.google.com/file/d/1bV9GT4um_0RpDxLIdjkZ-7Q8cMk6BJ6U/view?usp=sharing" &> "/dev/null"
    )

    mkdir "${HOME}/.ssh" &> "/dev/null"
    (
        cd "${HOME}/.ssh"

        # config
        goodls -u "https://drive.google.com/file/d/1u94i3xI0keixo3e1Lfv_ZFMrWLFUh7bm/view?usp=sharing" &> "/dev/null"
    )

    mkdir "${HOME}/.config/atuin" &> "/dev/null"
    (
        cd "${HOME}/.config/atuin"

        # config.toml
        goodls -u "https://drive.google.com/file/d/1OWHbmENvfx-RNvxYJUL51WLzt5UoSVWi/view?usp=sharing" &> "/dev/null"
    )

    mkdir "${HOME}/.config/zellij" &> "/dev/null"
    (
        cd "${HOME}/.config/zellij"

        # config.kdl
        goodls -u "https://drive.google.com/file/d/1-RRfDjOVctimSTZkCOstZdPQ-RqxT6m4/view?usp=sharing" &> "/dev/null"
    )

    if [ "${os}" = "Linux" ]; then
        mkdir "${HOME}/.config/btop" &> "/dev/null"
        (
            cd "${HOME}/.config/btop"

            # btop.conf
            goodls -u "https://drive.google.com/file/d/1jogoEZ2ioyw86j3b5RkH3qrS_1MOs-YC/view?usp=sharing" &> "/dev/null"
        )
    fi

    mkdir -p "${HOME}/.ipython/profile_default" &> "/dev/null"
    (
        cd "${HOME}/.ipython/profile_default"

        # ipython_config.py
        goodls -u "https://drive.google.com/file/d/1ZX7EflGFNWB-0Ni5WgKfVHH9WRQqOAQh/view?usp=sharing" &> "/dev/null"
    )
}
