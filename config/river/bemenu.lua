local M = {}
M.cmd = "bemenu-run -p 'Launch:' -H 20 --fn 'Source Code Pro 10'"

-- Table values (fg, bg, hi) are HTML hex color strings
M.colored_cmd = function(tbl)
	local fg = tbl.fg and tbl.fg or '#ffffff'
	local bg = tbl.bg and tbl.bg or '#000000'
	local hi = tbl.hi and tbl.hi or '#00ff00'

	-- Careful with the leading space
	local s = M.cmd .. (" --nf '%s' --nb '%s' --af '%s' --ab '%s' --tf '%s' --tb '%s' --sf '%s' --sb '%s' --hf '%s' --hb '%s' --ff '%s' --fb '%s' --fbf '%s' --fbb '%s' --scf '%s' --scb '%s'")
		:format(fg, bg, -- Normal
		        fg, bg, -- Alternating
		        bg, hi, -- Title
		        bg, fg, -- Selected
		        hi, bg, -- Highlighted
		        fg, bg, -- Filter
		        fg, bg, -- Feedback
		        fg, bg) -- Scrollbar
	return s
end

return M
