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
alias vim='vim --servername VIM'
alias yay='yay --pacman powerpill'
alias zrc='vim ~/.zshrc'
alias zre='source ~/.zshrc'
alias zup='omz update'
alias vrc='vim ~/.vimrc'
alias alrc='vim ~/alias.zsh'
alias envs='vim ~/env.zsh'
alias cp='cp -i'
alias ls='colorls --group-directories-first'
alias ll='colorls -lA --sd --gs --group-directories-first'
alias clr='clear'
alias py='conda activate base'
alias lab='jupyter lab --no-browser'
alias tlup='sudo tlmgr update --self --all --reinstall-forcibly-removed'
alias tlcc='sudo rm /usr/local/texlive/2021/tlpkg/backups/*'
alias pyup='pip install --user --upgrade pip jupyterlab-mathjax3 jupyterlab_code_formatter jupyterlab-lsp jupyterlab-git theme-darcula'
alias pycc='rm -rf ~/.cache/pip/http/* ~/.cache/pip/wheels/*'
alias jlup="http_proxy=http://$win_host:8128 https_proxy=http://$win_host:8128 julia -e 'using Pkg;Pkg.update()'"
alias jlcc="http_proxy=http://$win_host:8128 https_proxy=http://$win_host:8128 julia -e 'using Pkg,Dates;Pkg.gc(;collect_delay=Hour(0))'"
alias p10kcfg='p10k configure'
alias please='sudo'
alias plz='sudo'
alias privoxy="privoxy --no-daemon $HOME/.config/privoxy/privoxy.conf"
alias GAP='/usr/bin/gap'
alias edge="microsoft-edge-dev"
alias note='vim ~/note.txt'
alias prob='vim ~/CodesWSL/TeX/Problems.tex'
alias aria2c="aria2c --all-proxy=http://$win_host:8128/"
alias aria2rpc="aria2c --conf-path=$HOME/.aria2/aria2rpc.conf"
# alias ghci='stack ghci'
alias ghci='stack exec ghci'
alias runghc='stack runghc'
alias sudodiff='SUDO_EDITOR=vimdiff sudoedit'
alias HW="cd ~/CodesWSL/TeX/Homework && ls | ag '\.tex'"
alias tserver="ssh -i $HOME/keys/TencentServer root@43.129.74.141"
