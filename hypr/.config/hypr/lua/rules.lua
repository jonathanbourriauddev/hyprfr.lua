-- ============================================================
-- WINDOW RULES
-- ============================================================

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Fenêtres flottantes centrées, ne chevauchent pas la Waybar
hl.window_rule({
	name = "center-floating",
	match = { float = true },
	move = "monitor_w/2-w/2 monitor_h/2-h/2+22",
	center = true,
})
