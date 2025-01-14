function install_programs(){
    rm -rf "${PWD}/tmp_bootstrap"
    mkdir "${PWD}/tmp_bootstrap"
    (
        cd "${PWD}/tmp_bootstrap"

        PATH="${HOME}/.local/bin:${PATH}"
        export MAMBA_EXE="$(type -P "micromamba")"
        export MAMBA_ROOT_PREFIX="${HOME}/micromamba"

        printf -- "-Installing micromamba\n"
        curl -LOJsS "https://micro.mamba.pm/api/micromamba/${micromamba_id}/latest"
        tar -xj -f ${PWD}/micromamba*
        cp "${PWD}/bin/micromamba" "${HOME}/.local/bin"

        eval "$(micromamba shell hook --shell "bash")"
        micromamba activate

        printf -- "-Installing Python, ncurses, git, unzip, make, gawk\n"
        micromamba -y install -c conda-forge python=3.11 ncurses git unzip make gawk &> "/dev/null"

        printf -- "-Installing goodls\n"
        curl -LOJsS "https://github.com/tanaikech/goodls/releases/latest/download/goodls_${goodls_id}"
        chmod a+x ${PWD}/goodls*
        cp ${PWD}/goodls* "${HOME}/.local/bin/goodls"

        printf -- "-Installing atuin\n"
        # Fixes Error: unexpected trailing characters
        rm -rf "${HOME}/.local/share/atuin/last_sync_time"
        goodls -u "${atuin_id}" &> "/dev/null"
        chmod a+x "${PWD}/atuin"
        cp "${PWD}/atuin" "${HOME}/.local/bin"

        printf -- "-Installing bashrc_utils\n"
        git clone "https://github.com/gvlassis/bashrc_utils.git" &> "/dev/null"
        (
            cd bashrc_utils
            git remote set-url origin git@github.com:gvlassis/bashrc_utils.git
        )
        rm -rf "${HOME}/Projects/bashrc_utils"
        cp -R "${PWD}/bashrc_utils" "${HOME}/Projects"
        ln -sf "${HOME}/Projects/bashrc_utils" "${HOME}/.local/share"

        printf -- "-Installing catimg\n"
        goodls -u "${catimg_id}" &> "/dev/null"
        chmod a+x "${PWD}/catimg"
        cp "${PWD}/catimg" "${HOME}/.local/bin"

        printf -- "-Installing git-prompt.sh\n"
        curl -LOJsS "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
        cp "${PWD}/git-prompt.sh" "${HOME}/.local/share"

        printf -- "-Installing nnn\n"
        goodls -u "${nnn_id}" &> "/dev/null"
        chmod a+x "${PWD}/nnn"
        cp "${PWD}/nnn" "${HOME}/.local/bin"

        printf -- "-Installing quit.cd\n"
        goodls -u "https://drive.google.com/file/d/1xCKAoA0p8Nu8EnECJeZbjtpzMyNEUUwh/view?usp=sharing" &> "/dev/null"
        mkdir "${HOME}/.local/share/nnn" &> "/dev/null"
        cp "${PWD}/quitcd.sh" "${HOME}/.local/share/nnn"

        printf -- "-Installing pokecat\n"
        git clone "https://github.com/gvlassis/pokecat.git" &> "/dev/null"
        (
            cd pokecat
            git remote set-url origin git@github.com:gvlassis/pokecat.git
        )
        rm -rf "${HOME}/Projects/pokecat"
        cp -R "${PWD}/pokecat" "${HOME}/Projects"
        ln -sf "${HOME}/Projects/pokecat/src/pokecat.sh" "${HOME}/.local/bin"

        printf -- "-Installing rclone\n"
        curl -LOJsS "https://downloads.rclone.org/rclone-current-${rclone_id}.zip"
        unzip -q ${PWD}/rclone*
        cp ${PWD}/rclone*/rclone "${HOME}/.local/bin"

        printf -- "-Installing ble.sh\n"
        git clone --recursive --depth 1 --shallow-submodules "https://github.com/akinomyoga/ble.sh.git" &> "/dev/null"
        (
            cd ble.sh
            make install PREFIX="${HOME}/.local" &> "/dev/null"
        )

        printf -- "-Installing Python requests\n"
        ${HOME}/.local/bin/micromamba run -n base pip3 install requests &> "/dev/null"

        printf -- "-Installing zellij\n"
        curl -LOJsS "https://github.com/zellij-org/zellij/releases/latest/download/zellij-$zellij_id.tar.gz"
        tar -xz -f ${PWD}/zellij*
        cp ${PWD}/zellij "${HOME}/.local/bin/zellij"

        printf -- "-Installing btop\n"
        goodls -u "${btop_id}" &> "/dev/null"
        chmod a+x "${PWD}/btop"
        cp "${PWD}/btop" "${HOME}/.local/bin"

        printf -- "-Installing nvtop\n"
        goodls -u "${nvtop_id}" &> "/dev/null"
        chmod a+x "${PWD}/nvtop"
        cp "${PWD}/nvtop" "${HOME}/.local/bin"

        printf -- "-Installing soft\n"
        git clone "https://github.com/gvlassis/soft.git" &> "/dev/null"
        (
            cd soft
            git remote set-url origin git@github.com:gvlassis/soft.git
        )
        rm -rf "${HOME}/Projects/soft"
        cp -R "${PWD}/soft" "${HOME}/Projects"
        ln -sf "${HOME}/Projects/soft/src/soft.sh" "${HOME}/.local/bin"

        printf -- "-Installing proxychains\n"
        goodls -u "${proxychains_id}" &> "/dev/null"
        chmod a+x "${PWD}/proxychains4"
        cp "${PWD}/proxychains4" "${HOME}/.local/bin"

        printf -- "-Installing libproxychains\n"
        goodls -u "${libproxychains_id}" &> "/dev/null"
        cp ${PWD}/libproxychains4* "${HOME}/.local/bin"

        printf -- "-Installing kitty.bash\n"
        curl -LOJsS "https://raw.githubusercontent.com/kovidgoyal/kitty/master/shell-integration/bash/kitty.bash"
        cp "${PWD}/kitty.bash" "${HOME}/.local/share"

        printf -- "-Installing xterm-kitty\n"
        curl -LOJsS "https://github.com/kovidgoyal/kitty/raw/master/terminfo/x/xterm-kitty"
        mkdir "${HOME}/.terminfo" &> "/dev/null"
        mkdir "${HOME}/.terminfo/x" &> "/dev/null"
        cp "${PWD}/xterm-kitty" "${HOME}/.terminfo/x"

        printf -- "-Installing neovim\n"
        curl -LOJsS "${neovim_id}"
        tar -xz -f ${PWD}/nvim*
        cp ${PWD}/nvim*/bin/nvim "${HOME}/.local/bin"
        cp -r ${PWD}/nvim*/lib/* "${HOME}/.local/lib"
        cp -r ${PWD}/nvim*/share/nvim "${HOME}/.local/share"
        
        printf -- "-Installing vim-plug\n"
        curl -LOJsS "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
        mkdir -p "${HOME}/.local/share/nvim/site/autoload"
        cp "plug.vim" "${HOME}/.local/share/nvim/site/autoload"

        # Pull neovim config here so that plug-vim will work
        mkdir "${HOME}/.config/nvim" &> "/dev/null"
        (
            cd "${HOME}/.config/nvim"

            # init.lua
            goodls -u "https://drive.google.com/file/d/1RzO8knUUz1ZevYWEnCceFQemUFE8Eg6E/view?usp=sharing" &> "/dev/null"

            # .vimrc
            goodls -u "https://drive.google.com/file/d/1zuN5d0jc09QmWGeIuI2Y4dp9Cn7PA78j/view?usp=sharing" &> "/dev/null"
        )

        mkdir "${HOME}/.config/nvim/colors" &> "/dev/null"
        (
            cd "${HOME}/.config/nvim/colors"
            rm -rf $HOME/.config/nvim/colors/*
            
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/amber.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_amber.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_amber.vim"

            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/amethyst.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_amethyst.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_amethyst.vim"

            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/citrine.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_citrine.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_citrine.vim"

            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/emerald.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_emerald.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_emerald.vim"

            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/jade.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_jade.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_jade.vim"

            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/quartz.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_quartz.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_quartz.vim"

            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/ruby.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_ruby.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_ruby.vim"

            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/sapphire.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_sapphire.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_sapphire.vim"

            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/spinel.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_spinel.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_spinel.vim"

            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/topaz.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/light_topaz.vim"
            curl -LOJsS "https://raw.githubusercontent.com/gvlassis/gems/refs/heads/main/vim/dark_topaz.vim"
        )

        printf -- "-Installing neovim plugins\n"
        nvim --headless +PlugUpdate +quitall! &> "/dev/null"

        printf -- "-Installing termpdf.py\n"
        git clone "https://github.com/gvlassis/termpdf.py" &> "/dev/null"
        (
            cd termpdf.py
            ${HOME}/.local/bin/micromamba run -n base pip3 install PyMuPDF &> "/dev/null"
            ${HOME}/.local/bin/micromamba run -n base pip3 install -r requirements.txt &> "/dev/null"
            ${HOME}/.local/bin/micromamba run -n base pip3 install . &> "/dev/null"
        )
        
        printf -- "-Installing ipython\n"
        ${HOME}/.local/bin/micromamba run -n base pip3 install ipython &> "/dev/null"

        printf -- "-Installing matplotlib-backend-kitty\n"
        ${HOME}/.local/bin/micromamba run -n base pip3 install matplotlib-backend-kitty &> "/dev/null"
    )
    rm -rf "${PWD}/tmp_bootstrap"
}
