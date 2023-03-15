local rv = require 'river'

local term = 'foot'

-- Helpers
local bemenu_cmd = require 'bemenu'.colored_cmd { fg = '#f4e5bf', bg = '#1d2021', hi = '#8ac87d'}
local termcmd = function(s) return ([[%s -e sh -c '%s']]):format(term, s) end

rv.spawn_cmds = {
	-- Mod          Key        Command
	{'Super+Shift', 'B',      'pkill i3bar-river'},
	{'Super',       'B',      'brave-browser'},
	{'Super',       'Return', term},
	{'Super',       'P',      bemenu_cmd},
	{'Super',       'T',      termcmd('htop')},
}

-- Extra commands for riverctl
rv.riverctl_cmds = {
	'input pointer-10248-257-MSFT0001:01_2808:0101_Touchpad tap enabled',
}

-- Regular commands
-- rv.autostart = {
-- 	'i3bar-river',
-- 	'swaybg -i ~/pics/leaves_dark.jpg',
-- }

rv.apply()
