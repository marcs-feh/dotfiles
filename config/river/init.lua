local rv = require 'river'

local bemenu_cmd = "bemenu-run -p 'Launch:' -H 20 --fn 'Source Code Pro 10'"
do -- bemenu color config
	local fg = '#f4e5bf'
	local hi = '#8ac87d'
	local bg = '#1d2021'

	-- Careful with the leading space
	bemenu_cmd = bemenu_cmd .. (" --nf '%s' --nb '%s' af '%s' --ab '%s' tf '%s' --tb '%s' sf '%s' --sb '%s' hf '%s' --hb '%s' ff '%s' --fb '%s' fbf '%s' --fbb '%s' scf '%s' --scb '%s'")
		:format(fg, bg, -- Normal
		        fg, bg, -- Alternating
		        bg, hi, -- Title
		        bg, fg, -- Selected
		        hi, bg, -- Highlighted
		        fg, bg, -- Filter
		        fg, bg, -- Feedback
		        fg, bg) -- Scrollbar
end

rv.spawn_cmds = {
	-- Mod          Key        Command
	{'Super+Shift', 'B',      'pkill i3bar-river'},
	{'Super',       'B',      'brave-browser'},
	{'Super',       'Return', 'foot'},
	{'Super',       'P',      bemenu_cmd},
}

rv.apply()
