#!/usr/bin/env lua

local rv = require 'river'
local term = 'foot'

-- Helpers
local termcmd = function(s) return ([[%s -e sh -c '%s']]):format(term, s) end

rv.spawn_cmds = {
	-- Mod          Key        Command
	{'Super+Shift', 'B',      'pkill i3bar-river'},
	{'Super',       'B',      'brave-browser'},
	{'Super',       'Return', term},
	{'Super',       'P',      'bemenu-run -H 20 -p "Launch:" $BEMENU_COLORS'},
	{'Super',       'T',      termcmd('htop')},
}

-- Extra commands for riverctl
rv.riverctl_cmds = {
	'input pointer-10248-257-MSFT0001:01_2808:0101_Touchpad tap enabled',
	'keyboard-layout -options caps:swapescape us',
}

-- Regular commands
rv.autostart = {
	'i3bar-river',
	'swaybg -i ~/pics/leaves_dark.jpg',
	'rivertile -outer-padding 2 -view-padding 0',
}

rv.apply()
