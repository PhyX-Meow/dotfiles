# Set language environment
export LC_CTYPE="zh_CN.UTF-8"
export LANG="zh_CN.UTF-8"

# Set environment variables
export LD_LIBRARY_PATH=.:../lib:./lib
export PATH="$HOME/.local/bin:$HOME/.ghcup/bin:$HOME/.cabal/bin:$PATH"
export MKL_DEBUG_CPU_TYPE=5
export MKL_DYNAMIC=FALSE
export MKL_NUM_THREADS=8
export DOTNET_ROOT="/usr/share/dotnet"
export OPENBLAS_NUM_THREADS=8
export TEXLIVE_DOWNLOADER=wget
export TYPST_FONT_PATHS="/opt/texlive/current/texmf-dist/fonts/opentype/public/"
# export JULIA_PKG_SERVER="https://mirrors.pku.edu.cn/julia/"

export WIN_HOME="/mnt/c/Users/wuli"
export win_host="localhost"
# export win_host=`ip route show | grep -i default | awk '{ print $3}'`
# export win_host=`ipconfig.exe | grep -n4 WSL  | tail -n 1 | awk -F":" '{ print $2 }'  | sed 's/^[ \r\n\t]*//;s/[ \r\n\t]*$//'`

# Git proxy
# if [ "`git config --global --get https.proxy`" != http://$win_host:8128/ ]; then
#     git config --global https.proxy http://$win_host:8128/
# fi
# if [ "`git config --global --get http.proxy`" != http://$win_host:8128/ ]; then
#     git config --global http.proxy http://$win_host:8128/
# fi

# Proxy alias
export NO_PROXY=localhost,127.0.0.0/8,::1
export no_proxy=localhost,127.0.0.0/8,::1

# Set display
# export QT_SCALE_FACTOR=2
# export GDK_SCALE=2
export XCURSOR_SIZE=24

# Set input
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx

# Set editor
export EDITOR='gvim -v'
