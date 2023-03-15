local M = {}

string.join = function (self, tbl)
	local s = ''
	if #tbl == 0 then return s end
	for _, v in ipairs(tbl) do
		s = s .. tostring(v) .. self
	end
	return s:sub(1, #s - #self)
end

M.tags_count = 9

M.riverctl_cmds = {}

M.spawn_cmds = {}

M.autostart = {}

-- Bindings for the standard behavior
M.core_bindings = {
	exit  = {'Super+Shift', 'X'},
	close = {'Super', 'Q'},
	zoom  = {'Super', 'S'},
	toggle_float = {'Super', 'Space'},
	focus_next = {'Super', 'J'},
	focus_prev = {'Super', 'K'},
	swap_next = {'Super+Shift', 'J'},
	swap_prev = {'Super+Shift', 'k'},
	focus_out_next = {'Super', 'Period'},
	focus_out_prev = {'Super', 'Comma'},
	send_out_next = {'Super+Shift', 'Period'},
	send_out_prev = {'Super+Shift', 'Comma'},
	show_all = {'Super', '0'},
	pointer = {
		{'Super', 'BTN_LEFT', 'move-view'},
		{'Super', 'BTN_RIGHT', 'resize-view'},
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

M.rivertile_bindings = {
	-- Mod    Key      Command
	{'Super', 'Up',    'main-location top'},
	{'Super', 'Down',  'main-location bottom'},
	{'Super', 'Left',  'main-location left'},
	{'Super', 'Right', 'main-location right'},
	{'Super', 'L',     'main-ratio +0.05'},
	{'Super', 'H',     'main-ratio -0.05'},
	{'Super', 'A',     'main-count +1'},
	{'Super', 'D',     'main-count -1'},
}

M.options = {
	default_layout = 'rivertile',
	background     = '0x1e1e1e',
	border_focus   = '0xc4c4c4',
	border_unfocus = '0x1a1a1a',
}

M.apply = function()
	for _, p in ipairs(M.spawn_cmds) do
		print(('riverctl map normal %s %s spawn "%s"'):format(p[1], p[2], p[3]))
	end
		--'riverctl map normal'
	local b = M.core_bindings
	local cmds = {
		-- Text  Cmd
		{b.exit, 'exit'},
		{b.close, 'close'},
		{b.zoom, 'zoom'},
		{b.toggle_float, 'toggle-float'},
		{b.focus_next, 'focus-view next'},
		{b.focus_prev, 'focus-view previous'},
		{b.swap_next, 'swap next'},
		{b.swap_prev, 'swap previous'},
		{b.focus_out_next, 'focus-output next'},
		{b.focus_out_prev, 'focus-output previous'},
		{b.send_out_next, 'send-to-output next'},
		{b.send_out_prev, 'send-to-output previous'},
		{b.show_all, 'set-focused-tags '.. tostring(0xffffffff)},
	}
	local j = function(t) return (' '):join(t) end
	for _, cmd in ipairs(cmds) do
		print(('riverctl map normal %s %s'):format(j(cmd[1]), cmd[2]))
	end

	-- Pointer
	for _, bind in ipairs(b.pointer)do
		print(('riverctl map-pointer normal %s'):format(j(bind)))
	end

	-- Riverctl
	for _, c in ipairs(M.riverctl_cmds) do
		print('riverctl ' .. c)
	end

	-- Move
	for dir, key in pairs(b.move.keys) do
		print(('riverctl map normal %s %s move %s %d'):format(b.move.mod, key, dir, b.move.amount))
	end

	-- Snap
	for dir, key in pairs(b.snap.keys) do
		print(('riverctl map normal %s %s snap %s'):format(b.snap.mod, key, dir))
	end

	-- Resize
	for dir, _ in pairs(b.resize.keys) do
		for sign, key in pairs(b.resize.keys.vertical) do
			print(('riverctl map normal %s %s resize %s %s%d'):format(b.resize.mod, key, dir, sign, b.resize.amount))
		end
	end

	-- Autostart programs
	if #M.autostart > 0 then
		print((' & \n'):join(M.autostart) .. (' & \n'))
	end

end

return M
