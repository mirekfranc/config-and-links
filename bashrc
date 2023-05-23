set -o vi

alias e='emacs-nox'
alias aa=tmux
alias d='diff --color=always -u '
alias s='cd /export/x/kernel-source'
alias k='cd /export/x/kernel'
alias kk='cd /export/x/linux'
alias z='zypper'

alias t='cd /export/tracking-fixes/'

alias b='git branch'
alias ba='git ba'
alias orbital_laser='git branch -D'
send_to_orbit() {
    scp "$1" famke:~mfranc/public_html/
}
# reserved name: quantum_torpedo
photon_torpedo() {
    git push origin ":$1"
}

export LINUX_GIT=/export/x/linux
#export QUILT_PATCHES=/export/x/kernel-source
export PS1="\[\033[01;32m\]\u@\h \W\$ \[\033[0m\]"
#export GTK_THEME=Adwaita:dark

# Black   0;30
# Blue    0;34
# Green   0;32
# Cyan    0;36
# Red     0;31
# Purple  0;35
# Brown   0;33
# Blue    0;34
# Green   0;32
# Cyan    0;36
# Red     0;31
# Purple  0;35
# Brown   0;33

export SLOVNIK_LINES=42

vacation() {
    echo "$@" | sed 's/[^ ]*/\u&/g' | ssh l3mule 'nc localhost 5556'
}

export MAKEFLAGS='-j 16'

fetch_compile_db() {
    scp mfranc@kunlun:/labs/mfranc/kernel/compile_commands.json .
    sed -i "s!/labs/mfranc/kernel!$(pwd)!" compile_commands.json
}

# /etc/x3270/ibm_hosts
alias big_3270='c3270 -oversize 180x88 -set aidWait'    # columns * lines < 2 ^ 14
alias small_3270='c3270 -oversize 212x57 -set aidWait'  # columns * lines < 2 ^ 14

alias lock='swaylock -i /home/mfranc/Pictures/Wallpapers/saint_malo_mur.jpg'
alias nn='nmcli connection'
alias nnu='nmcli connection up'
alias nnd='nmcli connection down'

alias ms390='make ARCH=s390 CROSS_COMPILE=s390x-suse-linux-'
alias vclear='wl-copy -pc'
alias g=geeqie
alias svatek='sed -n $(date +%j)p ~/f/namedays.txt'
alias keyboard='swaymsg -t get_inputs | grep xkb_active_layout_name | tr -d "\",()," | cut -d: -f2 | sort -u'
alias list_nameservers='grep nameserver /etc/resolv.conf | cut -d" " -f2'
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/ { print \$2 }'"

export SSH_AUTH_SOCK=~/.ssh_sock_sway
K()
{
    ssh-agent -a $SSH_AUTH_SOCK && ssh-add ~/.ssh/id_rsa
}
