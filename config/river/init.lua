#!/usr/bin/env lua

local rv = require 'river'

local term = 'foot'
local browser = 'brave-browser'
local termcmd = function(s) return ([[%s -e sh -c '%s']]):format(term, s) end

rv.spawn_cmds = {
	-- Mod          Key        Command
	{'Super+Shift', 'B',      'pkill i3bar-river'},
	{'Super',       'B',      browser},
	{'Super',       'Return', term},
	{'Super',       'P',      'bemenu-run -H 20 -p "Launch:" $BEMENU_COLORS'},
	{'Super',       'T',      termcmd('htop')},
	{'Super+Shift', 'L',      'swaylock'},
	{'Super+Shift', 'B',      '~/.config/i3bar-river/toggle.sh'},
}

-- Regular commands
rv.autostart = {
	'i3bar-river',
	'swaybg -i ~/pics/leaves_dark.jpg',
	'rivertile -outer-padding 2 -view-padding 0',
}

-- Extra commands for riverctl
rv.riverctl_cmds = {
	'input pointer-10248-257-MSFT0001:01_2808:0101_Touchpad tap enabled',
	'keyboard-layout -options caps:swapescape us',
	'rule-add ssd -app-id "*"',
}

-- Bindings for River's core functions
rv.core_bindings = {
	exit  = {'Super+Shift', 'X'},
	close = {'Super', 'Q'},
	zoom  = {'Super', 'S'},
	fullscreen = {'Super+Shift', 'F'},
	set_focused_tags    = 'Super',
	set_view_tags       = 'Super+Shift',
	toggle_focused_tags = 'Super+Control',
	toggle_view_tags    = 'Super+Shift+Control',
	toggle_float = {'Super', 'Space'},
	focus_next = {'Super', 'J', rep = true},
	focus_prev = {'Super', 'K', rep = true},
	swap_next = {'Super+Shift', 'J', rep = true},
	swap_prev = {'Super+Shift', 'k', rep = true},
	focus_out_next = {'Super', 'Period'},
	focus_out_prev = {'Super', 'Comma'},
	send_out_next = {'Super+Shift', 'Period'},
	send_out_prev = {'Super+Shift', 'Comma'},
	show_all = {'Super', '0'},
	set_all  = {'Super+Shift', '0'},
	pointer = {
		{'Super', 'BTN_LEFT',   'move-view'},
		{'Super', 'BTN_RIGHT',  'resize-view'},
		{'Super', 'BTN_MIDDLE', 'toggle-float'},
	},
	tags = {
		set_focus       = 'Super',
		set_view_tag    = 'Super+Shift',
		toggle_focused  = 'Super+Control',
		toggle_view_tag = 'Super+Shift+Control',
	},
	resize = {
		mod = 'Super+Alt+Shift',
		amount = 50,
		keys = {
			vertical   = { ['-'] = 'K', ['+'] = 'J'},
			horizontal = { ['-'] = 'H', ['+'] = 'L'}
		},
	},
	move = {
		mod = 'Super+Alt',
		amount = 50,
		keys = { up = 'K', down = 'J', left = 'H', right = 'L'},
	},
	snap = {
		mod = 'Super+Alt+Control',
		keys = {up = 'K', down = 'J', left = 'H', right = 'L'},
	},
}

rv.rivertile_bindings = {
	-- Mod    Key      Command
	{'Super', 'Up',    'main-location top'},
	{'Super', 'Down',  'main-location bottom'},
	{'Super', 'Left',  'main-location left'},
	{'Super', 'Right', 'main-location right'},
	{'Super', 'L',     'main-ratio +0.05', rep = true},
	{'Super', 'H',     'main-ratio -0.05', rep = true},
	{'Super', 'A',     'main-count +1'},
	{'Super', 'D',     'main-count -1'},
}

rv.options = {
	default_layout   = 'rivertile',
	background       = '#1e1e1e',
	border_focused   = '#bab79d',
	border_unfocused = '#1d2021',
}

rv.apply()
