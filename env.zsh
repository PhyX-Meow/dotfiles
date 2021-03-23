# Set language environment
export LC_CTYPE="zh_CN.UTF-8"
export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"

# Set environment variables
export PATH="/home/wuli/.gem/ruby/2.7.0/bin:$PATH"
export DOTNET_ROOT="/usr/share/dotnet"
export MANIMLIB="$HOME/git/manim"
export LD_LIBRARY_PATH=.:../lib:./lib
export MKL_DEBUG_CPU_TYPE=5
export MKL_DYNAMIC=FALSE
export MKL_NUM_THREADS=16
export JULIA_PKG_SERVER="https://mirrors.tuna.tsinghua.edu.cn/julia"

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
export DISPLAY=$win_host:0
export QT_SCALE_FACTOR=2
export GDK_SCALE=2

# Set audio
export PULSE_SERVER=tcp:$win_host
export audio_server_conf="/mnt/c/Program Files (local)/Pulse Audio/etc/pulse/default.pa"
if [ "`cat $audio_server_conf | grep auth-ip-acl | awk -F '=' '{ print $2 }'`" != $wsl_host ]; then
sed -i "s/auth-ip-acl=.*/auth-ip-acl=$wsl_host/" $audio_server_conf
fi

# Set input
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Set editor
export EDITOR='gvim -v'
