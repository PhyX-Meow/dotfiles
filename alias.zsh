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
alias lab='jupyter lab'
alias E:='cd /mnt/e/'
alias D:='cd /mnt/d/'
alias C:='cd /mnt/c/'
alias tlup='sudo tlmgr update --self --all --reinstall-forcibly-removed'
alias tlcc='sudo rm /usr/local/texlive/2020/tlpkg/backups/*'
alias pyup='pip install --user --upgrade pip jupyterlab_code_formatter python-language-server[all] jupyter-lsp jupyterlab-github python-telegram-bot glances'
alias pycc='rm -rf ~/.cache/pip/http/* ~/.cache/pip/wheels/*'
alias jlup="http_proxy=http://$win_host:8128 https_proxy=http://$win_host:8128 julia -e 'using Pkg;Pkg.update()'"
alias jlcc="http_proxy=http://$win_host:8128 https_proxy=http://$win_host:8128 julia -e 'using Pkg,Dates;Pkg.gc(;collect_delay=Hour(0))'"
alias rbup='gem update'
alias rbcc='gem clean'
alias p10kcfg='p10k configure'
alias please='sudo'
alias plz='sudo'
alias mgcc='x86_64-w64-mingw32-gcc'
alias mg++='x86_64-w64-mingw32-g++'
alias privoxy="privoxy --no-daemon $HOME/.config/privoxy/privoxy.conf"
alias GAP='/usr/bin/gap'
alias note='vim ~/note.txt'
alias prob='vim ~/CodesWSL/TeX/Problems.tex'
alias chrome='google-chrome-stable'
alias aria2c="aria2c --all-proxy=http://$win_host:8128/"
alias aria2rpc="aria2c --conf-path=$HOME/.aria2/aria2rpc.conf"
# alias ghci='stack ghci'
alias ghci='stack exec ghci'
alias runghc='stack runghc'
alias sudodiff='SUDO_EDITOR=vimdiff sudoedit'
alias HW="cd ~/CodesWSL/TeX/Homework && ls | grep '\.tex'"
