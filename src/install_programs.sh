function install_programs(){
    rm -rf "${PWD}/tmp_bootstrap"
    mkdir "${PWD}/tmp_bootstrap"
    (
        cd "${PWD}/tmp_bootstrap"

        PATH="${HOME}/.local/bin:${PATH}"
        export MAMBA_EXE="$(type -P "micromamba")"
        export MAMBA_ROOT_PREFIX="${HOME}/micromamba"

        printf "\x1b[3;35mInstalling micromamba\x1b[0m\n"
        curl -LOJ "https://micro.mamba.pm/api/micromamba/${micromamba_id}/latest"
        tar -xj -f ${PWD}/micromamba*
        cp "${PWD}/bin/micromamba" "${HOME}/.local/bin"

        eval "$(micromamba shell hook --shell "bash")"
        micromamba activate

        # Two versions behind
        printf "\x1b[3;35mInstalling Python, unzip, make, gawk, Node.js\x1b[0m\n"
        micromamba -y install -c conda-forge python=3.13 unzip make gawk nodejs

        printf "\x1b[3;35mInstalling gdown\x1b[0m\n"
        micromamba run -n base pip3 install gdown

        printf "\x1b[3;35mInstalling atuin\x1b[0m\n"
        # Fixes Error: unexpected trailing characters
        rm -rf "${HOME}/.local/share/atuin/last_sync_time"
        gdown --fuzzy "${atuin_id}"
        chmod a+x "${PWD}/atuin"
        cp "${PWD}/atuin" "${HOME}/.local/bin"

        printf "\x1b[3;35mInstalling bashrc_utils\x1b[0m\n"
        git clone "https://github.com/gvlassis/bashrc_utils.git"
        (
            cd bashrc_utils
            git remote set-url origin git@github.com:gvlassis/bashrc_utils.git
        )
        rm -rf "${HOME}/Projects/bashrc_utils"
        cp -R "${PWD}/bashrc_utils" "${HOME}/Projects"
        ln -sf "${HOME}/Projects/bashrc_utils" "${HOME}/.local/share"

        printf "\x1b[3;35mInstalling catimg\x1b[0m\n"
        gdown --fuzzy "${catimg_id}"
        chmod a+x "${PWD}/catimg"
        cp "${PWD}/catimg" "${HOME}/.local/bin"

        printf "\x1b[3;35mInstalling git-prompt.sh\x1b[0m\n"
        curl -LOJ "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
        cp "${PWD}/git-prompt.sh" "${HOME}/.local/share"

        printf "\x1b[3;35mInstalling nnn\x1b[0m\n"
        gdown --fuzzy "${nnn_id}"
        chmod a+x "${PWD}/nnn"
        cp "${PWD}/nnn" "${HOME}/.local/bin"

        printf "\x1b[3;35mInstalling quit.cd\x1b[0m\n"
        gdown --fuzzy "https://drive.google.com/file/d/1xCKAoA0p8Nu8EnECJeZbjtpzMyNEUUwh/view?usp=sharing"
        mkdir "${HOME}/.local/share/nnn"
        cp "${PWD}/quitcd.sh" "${HOME}/.local/share/nnn"

        printf "\x1b[3;35mInstalling pokecat\x1b[0m\n"
        git clone "https://github.com/gvlassis/pokecat.git"
        (
            cd pokecat
            git remote set-url origin git@github.com:gvlassis/pokecat.git
        )
        rm -rf "${HOME}/Projects/pokecat"
        cp -R "${PWD}/pokecat" "${HOME}/Projects"
        ln -sf "${HOME}/Projects/pokecat/src/pokecat.sh" "${HOME}/.local/bin"

        printf "\x1b[3;35mInstalling rclone\x1b[0m\n"
        curl -LOJ "https://downloads.rclone.org/rclone-current-${rclone_id}.zip"
        unzip -q ${PWD}/rclone*
        cp ${PWD}/rclone*/rclone "${HOME}/.local/bin"

        printf "\x1b[3;35mInstalling ble.sh\x1b[0m\n"
        git clone --recursive --depth 1 --shallow-submodules "https://github.com/akinomyoga/ble.sh.git"
        (
            cd ble.sh
            make install PREFIX="${HOME}/.local"
        )

        printf "\x1b[3;35mInstalling Python requests\x1b[0m\n"
        micromamba run -n base pip3 install requests

        printf "\x1b[3;35mInstalling zellij\x1b[0m\n"
        curl -LOJ "https://github.com/zellij-org/zellij/releases/latest/download/zellij-$zellij_id.tar.gz"
        tar -xz -f ${PWD}/zellij*
        cp ${PWD}/zellij "${HOME}/.local/bin/zellij"
        
        if [ "${os}" = "Linux" ]; then
            printf "\x1b[3;35mInstalling btop\x1b[0m\n"
            gdown --fuzzy "${btop_id}"
            chmod a+x "${PWD}/btop"
            cp "${PWD}/btop" "${HOME}/.local/bin"
        fi

        printf "\x1b[3;35mInstalling soft\x1b[0m\n"
        git clone "https://github.com/gvlassis/soft.git"
        (
            cd soft
            git remote set-url origin git@github.com:gvlassis/soft.git
        )
        rm -rf "${HOME}/Projects/soft"
        cp -R "${PWD}/soft" "${HOME}/Projects"
        ln -sf "${HOME}/Projects/soft/src/soft.sh" "${HOME}/.local/bin"

        printf "\x1b[3;35mInstalling kitty.bash\x1b[0m\n"
        curl -LOJ "https://raw.githubusercontent.com/kovidgoyal/kitty/master/shell-integration/bash/kitty.bash"
        cp "${PWD}/kitty.bash" "${HOME}/.local/share"

        printf "\x1b[3;35mInstalling xterm-kitty\x1b[0m\n"
        curl -LOJ "https://github.com/kovidgoyal/kitty/raw/master/terminfo/x/xterm-kitty"
        mkdir "${HOME}/.terminfo"
        mkdir "${HOME}/.terminfo/x"
        cp "${PWD}/xterm-kitty" "${HOME}/.terminfo/x"

        printf "\x1b[3;35mInstalling neovim\x1b[0m\n"
        gdown --fuzzy "${neovim_id}"
        tar -x -f ${PWD}/nvim.tar
        mkdir "${HOME}/.local/lib/nvim"
        mkdir "${HOME}/.local/share/nvim"
        cp ${PWD}/nvim/bin/nvim "${HOME}/.local/bin"
        cp -r ${PWD}/nvim/lib/* "${HOME}/.local/lib/nvim"
        cp -r ${PWD}/nvim/share/* "${HOME}/.local/share/nvim"
        
        printf "\x1b[3;35mInstalling vim-plug\x1b[0m\n"
        curl -LOJ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
        mkdir -p "${HOME}/.local/share/nvim/site/autoload"
        cp "plug.vim" "${HOME}/.local/share/nvim/site/autoload"

        # Pull neovim config here so that plug-vim will work
        mkdir "${HOME}/.config/nvim"
        (
            cd "${HOME}/.config/nvim"

            # init.lua
            gdown --fuzzy "https://drive.google.com/file/d/1RzO8knUUz1ZevYWEnCceFQemUFE8Eg6E/view?usp=sharing"

            # .vimrc
            gdown --fuzzy "https://drive.google.com/file/d/1zuN5d0jc09QmWGeIuI2Y4dp9Cn7PA78j/view?usp=sharing"
        )

        mkdir "${HOME}/.config/nvim/colors"
        (
            cd "${HOME}/.config/nvim/colors"
            rm -rf $HOME/.config/nvim/colors/*
            
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/amber.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_amber.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_amber.vim"

            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/amethyst.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_amethyst.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_amethyst.vim"

            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/citrine.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_citrine.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_citrine.vim"

            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/emerald.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_emerald.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_emerald.vim"

            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/jade.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_jade.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_jade.vim"

            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/quartz.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_quartz.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_quartz.vim"

            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/ruby.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_ruby.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_ruby.vim"

            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/sapphire.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_sapphire.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_sapphire.vim"

            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/spinel.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_spinel.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_spinel.vim"

            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/topaz.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_topaz.vim"
            curl -LOJ "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_topaz.vim"
        )

        printf "\x1b[3;35mInstalling neovim plugins\x1b[0m\n"
        nvim --headless +PlugUpdate +quitall!

        printf "\x1b[3;35mInstalling termpdf.py\x1b[0m\n"
        git clone "https://github.com/gvlassis/termpdf.py"
        (
            cd termpdf.py
            micromamba run -n base pip3 install PyMuPDF
            micromamba run -n base pip3 install -r requirements.txt
            micromamba run -n base pip3 install .
        )
        
        printf "\x1b[3;35mInstalling ipython\x1b[0m\n"
        micromamba run -n base pip3 install ipython

        printf "\x1b[3;35mInstalling kitcat\x1b[0m\n"
        micromamba run -n base pip3 install kitcat

        printf "\x1b[3;35mInstalling matrixplot\x1b[0m\n"
        micromamba run -n base pip3 install matrixplot

        printf "\x1b[3;35mInstalling gvtop\x1b[0m\n"
        micromamba run -n base pip3 install git+https://github.com/gvlassis/gvtop

        printf "\x1b[3;35mInstalling Codex\x1b[0m\n"
        micromamba run -n base npm install -g @openai/codex@latest
    )
    rm -rf "${PWD}/tmp_bootstrap"
}
