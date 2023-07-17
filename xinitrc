#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Merge in defaults and keymaps
test -f $sysresources	&& xrdb -merge  $sysresources
test -f $sysmodmap	   && xmodmap	  $sysmodmap
test -f "$userresources" && xrdb -merge "$userresources"
test -f "$usermodmap"	&& xmodmap	 "$usermodmap"

# Start some nice programs
eval $(ssh-agent)
test $(which xsetroot)  && xsetroot -solid "#303030" &
test $(which gpg-agent) && eval $(gpg-agent --daemon)
test $(which xbanish)   && xbanish >>$HOME/.local/share/log/xbanish.log &

SetupTouchpad(){
	touchpad_id=$(xinput list | grep Touchpad | grep -oE 'id=[0-9]+' | grep -oE '[0-9]+')
	touchpad_tap=$(xinput list-props $touchpad_id | grep -oE 'Tapping Enabled \([0-9]+\)' | grep -oE '[0-9]+')
	xinput set-prop $touchpad_id $touchpad_tap 1
}

# Required for certain apps (such as plank) to run
export XDG_SESSION_DESKTOP=X11
export XDG_SESSION_TYPE=X11
export XDG_CURRENT_DESKTOP=X11
export DESKTOP_SESSION=X11
export XDG_DESKTOP_DIR="$HOME/.desktop"

# WM startup functions

# dwm
dwmInit() {
	wmname LG3D &  # This is for certain java apps
	dwm_statusbar &
	xss-lock slock &
	~/.fehbg &
	xcompmgr &
	exec dwm
}

# i3
i3_init() {
	wmname LG3D &  # This is for certain java apps
	~/.fehbg &
	exec i3
}

# Start X11
setxkbmap us -option caps:swapescape &
xrdb ~/.Xresources &
xbanish -t 10 -i mod4 &
{ sleep 5 ; SetupTouchpad; } &
# exec icewm-session
dwmInit

