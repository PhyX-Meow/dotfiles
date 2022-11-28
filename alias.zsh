alias spxy="
	export all_proxy=$WIN_PROXY;
    export http_proxy=$WIN_PROXY;
    export https_proxy=$WIN_PROXY;
	export ALL_PROXY=$WIN_PROXY;
    export HTTP_PROXY=$WIN_PROXY;
    export HTTPS_PROXY=$WIN_PROXY;"
alias pxy="
	export all_proxy=http://$win_host:8128/;
    export http_proxy=http://$win_host:8128/;
    export https_proxy=http://$win_host:8128/;
	export ALL_PROXY=http://$win_host:8128/;
    export HTTP_PROXY=http://$win_host:8128/;
    export HTTPS_PROXY=http://$win_host:8128/;"
alias upxy="
	unset all_proxy;
    unset http_proxy;
    unset https_proxy;
	unset ALL_PROXY;
    unset HTTP_PROXY;
    unset HTTPS_PROXY;"
alias vim="DISPLAY=$win_host:0 gvim -v --servername VIM"
alias yay='yay --pacman powerpill'
alias zrc='vim ~/.zshrc'
alias zre='source ~/.zshrc'
alias zup='omz update'
alias vrc='vim ~/.vimrc'
alias alrc='vim ~/alias.zsh'
alias envs='vim ~/env.zsh'
alias cp='cp -i'
# alias ls='colorls --group-directories-first'
# alias ll='colorls -lA --sd --gs --group-directories-first'
alias ls='exa --icons'
alias l='exa --long --icons --git'
alias ll='exa --long --all --icons --git --header'
alias clr='clear'
alias py='conda activate base'
alias lab='jupyter lab --no-browser'
alias julia='LD_PRELOAD=/usr/lib/libstdc++.so.6 julia'
alias pluto="julia -e 'import Pluto;Pluto.run(port=8889)'"
alias juhs="jupyter console --kernel=haskell"
alias tlup='sudo tlmgr update --self --all --reinstall-forcibly-removed'
alias tlcc='sudo rm /usr/local/texlive/current/tlpkg/backups/*'
alias pyup='pip install --user --upgrade pip jupyterlab-mathjax3 theme-darcula jill wget'
alias pycc='rm -rf ~/.cache/pip/http/* ~/.cache/pip/wheels/*'
alias jlup="http_proxy=http://$win_host:8128 https_proxy=http://$win_host:8128 julia -e 'using Pkg;Pkg.update()'"
alias jlcc="http_proxy=http://$win_host:8128 https_proxy=http://$win_host:8128 julia -e 'using Pkg,Dates;Pkg.gc(;collect_delay=Hour(0))'"
alias p10kcfg='p10k configure'
alias please='sudo'
alias plz='sudo'
alias privoxy="privoxy --no-daemon $HOME/.config/privoxy/privoxy.conf"
alias note='vim ~/note.txt'
alias prob='vim ~/CodesWSL/TeX/Problems.tex'
alias aria2c="aria2c --all-proxy=http://$win_host:8128/"
alias aria2rpc="aria2c --conf-path=$HOME/.aria2/aria2rpc.conf"
alias ghcup="ghcup --downloader wget"
alias idris="rlwrap idris2"
alias sudoedit="DISPLAY=$win_host:0 sudoedit"
alias sudodiff='SUDO_EDITOR=vimdiff sudoedit'
alias HW='cd ~/CodesWSL/TeX/Homework'
alias texpre='vim ~/texmf/tex/latex/local/phyxmeow-common.sty'
alias texsnip='vim ~/.vim/UltiSnips/tex.snippets'
alias tserver="ssh -i $HOME/keys/TencentServer root@43.129.74.141"
