local M = {}

M.keymap = function (mod, key, data, action)
	if not action then action = '' end
	if not data then data = '' end
	if action == 'spawn' then
		data = '"' .. data .. '"'
	end
 	return ('riverctl map normal %s %s %s %s'):format(mod, key, action, data)
end

M.spawn_cmds = {}

-- Bindings for the standard behavior
M.bindings = {
	exit  = {'Super+Shift', 'X'},
	close = {'Super', 'Q'},
	zoom  = {'Super', 'S'},
	swap_next = {'Super+Shift', 'J'},
	swap_prev = {'Super+Shift', 'k'},
	focus_out_next = {},
	focus_out_prev = {},
	send_out_next = {},
	send_out_prev = {},
}

M.options = {
	tags_count = 9,
	default_layout = 'rivertile',
	background     = '0x1e1e1e',
	border_focus   = '0xc4c4c4',
	border_unfocus = '0x1a1a1a',
}

M.apply = function()
	if (M.options.tags_count > 9) or (M.options.tags_count < 1) then
		M.options.tags_count = 9
		print('tags_count must be between 1 and 9')
	end
	for _, p in ipairs(M.spawn_cmds) do
		print(M.keymap(p[1], p[2], p[3], 'spawn'))
	end
end

return M
