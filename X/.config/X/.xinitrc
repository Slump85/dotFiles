#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.config/X/.Xresources
usermodmap=$HOME/.config/X/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

SESSION=${1:-xfce-session}

# merge in defaults and keymaps

if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

get_session() {
	local dbus_args=(--sh-syntax --exit-with-session)
	case "$1" in
	dwm) dbus_args+=(dwm) ;;
	i3 | i3wm) dbus_args+=(i3 --shmlog-size 0) ;;
	xfce) dbus_args+=(xfce4-session) ;;
	esac

	echo "dbus-launch ${dbus_args[*]}"
}

exec udiskie &

exec dwm
# exec $(get_session "$1")
# xset r rate 660 25
