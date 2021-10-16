# Set language environment
export LC_CTYPE="zh_CN.UTF-8"
export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"

# Set environment variables
export LD_LIBRARY_PATH=.:../lib:./lib
export PATH="$HOME/.local/bin:$PATH"
export MKL_DEBUG_CPU_TYPE=5
export MKL_DYNAMIC=FALSE
export MKL_NUM_THREADS=16
export DOTNET_ROOT="/usr/share/dotnet"
export JULIA_PKG_SERVER="https://mirrors.tuna.tsinghua.edu.cn/julia"
export TEXLIVE_DOWNLOADER=wget

export WINHOME="/mnt/c/Users/wuli"
export win_host=`cat /etc/resolv.conf | grep nameserver | awk '{print $2}'`
# export win_host=`ipconfig.exe | grep -n4 WSL  | tail -n 1 | awk -F":" '{ print $2 }'  | sed 's/^[ \r\n\t]*//;s/[ \r\n\t]*$//'`
export wsl_host=`ip addr | grep "inet.*eth0" | awk -F ' ' '{ print $2 }' | sed 's/\/[0-9]*//'`
export privoxy_conf="$HOME/.config/privoxy/privoxy.conf"

# Set hosts
# if [ "`cat $win_hosts_file | grep winhost`" != "" ]; then
	# if [ "`cat $win_hosts_file | grep wsl | awk -F ' ' '{ print $1 }'`" != $win_host ]; then
		# sed "/winhost/c\\$win_host winhost" $win_hosts_file > $HOME/.hoststemp
        # mv $HOME/.hoststemp $win_hosts_file
		# ipconfig.exe /flushdns > /dev/null
	# fi
# else
	# # sed -i "$ a $wsl_host winhost" $win_hosts_file
	# echo "$win_host winhost" >> $win_hosts_file
	# ipconfig.exe /flushdns > /dev/null
# fi

# Git proxy
if [ "`git config --global --get https.proxy`" != http://$win_host:8128/ ]; then
	git config --global https.proxy http://$win_host:8128/
fi
if [ "`git config --global --get http.proxy`" != http://$win_host:8128/ ]; then
	git config --global http.proxy http://$win_host:8128/
fi

# Proxy alias
export WIN_PROXY=socks5://$win_host:8128/
export NO_PROXY=localhost,127.0.0.0/8,::1
export no_proxy=localhost,127.0.0.0/8,::1

# Set display
export QT_SCALE_FACTOR=2
export GDK_SCALE=2

# Set audio
# export PULSE_SERVER=tcp:$win_host

# Set input
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Set editor
export EDITOR='gvim -v'

# Fix qt app inside bottle
wsl_mount_root=/mnt
wsl_windir="${wsl_mount_root}/c/Windows/System32"
wsl_distro=Arch
wsl_wslg_display=0

# check if in-built wslg socket exists at all
# if test -S $wsl_mount_root/wslg/.X11-unix/X0; then
        # # fix is needed in case system socket in /tmp doesn't exist or it's true, canonical path isn't the wslg socket's one
        # if ! test -e /tmp/.X11-unix/X${wsl_wslg_display} || ! test "$(readlink -f /tmp/.X11-unix/X${wsl_wslg_display})" = "$wsl_mount_root/wslg/.X11-unix/X0"; then
            # # echo -e "* WSL: restoring WSLG X11 server socket on /tmp/.X11-unix/X${wsl_wslg_display}"
            # # recreate /tmp/.X11-unix directory if needed
            # if test ! -d /tmp/.X11-unix; then
                # $wsl_windir/wsl.exe -d $wsl_distro -u root install -dm 1777 -o root /tmp/.X11-unix
            # fi
            # # delete existing socket if needed. this must obviously break something that created that socket
            # # and you'd rather define display not colliding with other sockets
            # if test -e /tmp/.X11-unix/X${wsl_wslg_display}; then
                # $wsl_windir/wsl.exe -d $wsl_distro -u root rm -Rf /tmp/.X11-unix/X${wsl_wslg_display} /tmp/.X${wsl_wslg_display}-lock
            # fi
            # # if desired display is different than wslg's default 0, check if WSLG socket doesn't already exist on X0
            # # if yes, delete it aswell to avoid having the same wslg socket bound to two separate display numbers
            # if test $wsl_wslg_display -ne 0; then
                # if test -e /tmp/.X11-unix/X0 && test "$(readlink -f /tmp/.X11-unix/X0)" = "$wsl_mount_root/wslg/.X11-unix/X0"; then
                    # $wsl_windir/wsl.exe -d $wsl_distro -u root rm -Rf /tmp/.X11-unix/X0 /tmp/.X0-lock
                # fi
            # fi
            # # create symlink to wslg socket
            # $wsl_windir/wsl.exe -d $wsl_distro -u root ln -s $wsl_mount_root/wslg/.X11-unix/X0 /tmp/.X11-unix/X${wsl_wslg_display}
            # # export updated display number for user's convenience
            # export DISPLAY=:${wsl_wslg_display}
        # fi
# fi
