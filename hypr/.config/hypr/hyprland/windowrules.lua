-- window rules
hl.window_rule({
	float = true,
	match = { class = "waypaper" }
})
hl.window_rule({
	float = true,
	match = { class = "thunar" },
    size = { 1000, 800 }
})
hl.window_rule({
	float = true,
	match = { class = "nordvpn-gui" }
})
hl.window_rule({
	float = true,
	match = { class = "com.github.wwmm.easyeffects" }
})
hl.window_rule({
	float = true,
	match = { class = "font-manager" },
    size = { 1000, 800 }
})
hl.window_rule({
	float = true,
	match = { class = "org.twosheds.iwgtk" },
    size = { 1000, 800 }
})
hl.window_rule({
	float = true,
	match = { class = "ca.parallel_launcher.ParallelLauncher" }
})
hl.window_rule({
	float = true,
	match = { class = "com.usebottles.bottles" }
})
hl.window_rule({
	float = true,
	match = { class = "retroarch" }
})
hl.window_rule({
	float = true,
	match = { class = "blueman-manager" }
})
hl.window_rule({
	float = true,
	match = { class = "nautilif" }
})
hl.window_rule({
    border_size = 0,
    rounding = 0,
    fullscreen = true,
    monitor = "eDP-1",
    match = { class = "^(steam_app_\\d+)$" }
})
hl.window_rule({
    border_size = 0,
    rounding = 0,
    fullscreen = true,
    monitor = "DP-1",
    match = { title = "dusklight"}
})
hl.window_rule({
    opacity = "1.0 0.95",
    match = { class = "kitty" }
})

-- layer rules
hl.layer_rule({
    ignore_alpha =  0.8,
    match = { class = "wofi" }
})
hl.layer_rule({
    ignore_alpha = 0.5,
    match = { class = "swaync-control-center" }
})
hl.layer_rule({
    ignore_alpha = 0.5,
    match = { class = "swaync-notification-window" }
})
hl.layer_rule({
  name = "swaync-slide-right",
  match = { namespace = "swaync-control-center" },
  animation = "slide right", -- Applies the 'slide right' style
  blur = true,               -- Optional: Enable blur
  ignore_alpha = 0.5,        -- Optional: Adjust transparency
})

