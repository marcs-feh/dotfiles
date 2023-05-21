#!/bin/bash

# Basic prompt
PS1="$ "

# Path setup
export PATH="$PATH:$HOME/.scripts/:$HOME/.local/bin/:$HOME/.cargo/bin/"
export GOPATH="$HOME/.local/share/go/"

export XDG_CURRENT_DESKTOP='sway' # Soy-powered apps sometimes require this.

# Apps
export VISUAL='nvim'
export EDITOR='nvim'
export WEB_BROWSER='firefox'
export IMAGE_VIEWER='gwenview'
export VIDEO_PLAYER='mpv'
export DOC_VIEWER='zathura'
export CC='clang'
export CXX='clang++'

local hi='#8ac87d' bg='#1d2021' fg='#f4e5bf';
export BEMENU_OPTS="-i -H 20 --nf '$fg' --nb '$bg' --af '$fg' --ab '$bg' --tf '$bg' --tb '$hi' --sf '$bg' --sb '$fg' --hf '$hi' --hb '$bg' --ff '$fg' --fb '$bg' --fbf '$fg' --fbb '$bg' --scf '$fg' --scb '$bg'"

# App configs
export NNN_PLUG='j:jump;i:imgview;p:pdfview'
export FZF_DEFAULT_OPTS='--height=30% --info=default --color=16 --layout=reverse --no-bold'
export EXINIT=':set tabstop=2 autoindent ignorecase'
export CALIBRE_USE_DARK_PALETTE=1
export QT_QPA_PLATFORMTHEME=qt5ct
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=00;37:*.jpeg=00;37:*.mjpg=00;37:*.mjpeg=01;35:*.gif=00;37:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=00;37:*.svg=00;37:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=00;37:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';

# Other info
export DEBUGINFOD_URLS=$(cat /etc/debuginfod/archlinux.urls)

# ash requires ENV to be exported
[ "$0" = "ash" ] \
	&& export ENV="$HOME/.ashrc" \
	&& source "$ENV"


# Ask user wheather or not to start GUI
[ -z "$TMUX" ] && {
	printf "== \033[0;32m$(date +'%b %d(%a) %H:%M')\033[0m ==\n"
	printf "Welcome back, \033[0;36m$USER\033[0;m\n"
	printf 'Start GUI?\n'
	printf '\t\033[0;36mX\033[0m11 (default)\n'
	printf '\t\033[0;36mW\033[0mayland\n'
	printf '\t\033[0;36mN\033[0mo\n'
	read gui_type

	case "$gui_type" in
		'X'|'x') startx ;;
		'W'|'w') Hyprland ;;
		'N'|'n') echo 'No GUI';;
	esac

	[ -z "$gui_type" ] && startx
}

