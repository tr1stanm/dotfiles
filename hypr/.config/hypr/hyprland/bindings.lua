local mainMod = "SUPER"
local term = "kitty"
local browser = "brave"
local fileManager = "thunar"
local menu = "wofi --show drun -n"

-- program binds
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(term))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("easyeffects"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("spotify-launcher"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(term .. " -e cava"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("filezilla"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("prismlauncher"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("waypaper"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("waypaper --random"))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("/usr/bin/sudo /home/tristan/.config/scripts/changegif_random.sh"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("nautilif"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(term .. " -o background_opacity=0.9 -e btop"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -op"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("~/.config/swaync/refresh.sh"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("flatpak run com.discordapp.Discord"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("pkill waybar ; waybar"))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("switch:on:Lid Switch", function()
    hl.dsp.exec_cmd("systemctl suspend")
end)

-- brightness
hl.bind(mainMod .. " + CONTROL + 1", hl.dsp.exec_cmd("ddcutil --dis=1 setvcp 10 10"))
hl.bind(mainMod .. " + CONTROL + 1", hl.dsp.exec_cmd("ddcutil --dis=2 setvcp 10 10"))
hl.bind(mainMod .. " + CONTROL + 2", hl.dsp.exec_cmd("ddcutil --dis=1 setvcp 10 20"))
hl.bind(mainMod .. " + CONTROL + 2", hl.dsp.exec_cmd("ddcutil --dis=2 setvcp 10 20"))
hl.bind(mainMod .. " + CONTROL + 3", hl.dsp.exec_cmd("ddcutil --dis=1 setvcp 10 30"))
hl.bind(mainMod .. " + CONTROL + 3", hl.dsp.exec_cmd("ddcutil --dis=2 setvcp 10 30"))
hl.bind(mainMod .. " + CONTROL + 4", hl.dsp.exec_cmd("ddcutil --dis=1 setvcp 10 40"))
hl.bind(mainMod .. " + CONTROL + 4", hl.dsp.exec_cmd("ddcutil --dis=2 setvcp 10 40"))
hl.bind(mainMod .. " + CONTROL + 5", hl.dsp.exec_cmd("ddcutil --dis=1 setvcp 10 50"))
hl.bind(mainMod .. " + CONTROL + 5", hl.dsp.exec_cmd("ddcutil --dis=2 setvcp 10 50"))
hl.bind(mainMod .. " + CONTROL + 6", hl.dsp.exec_cmd("ddcutil --dis=1 setvcp 10 60"))
hl.bind(mainMod .. " + CONTROL + 6", hl.dsp.exec_cmd("ddcutil --dis=2 setvcp 10 60"))
hl.bind(mainMod .. " + CONTROL + 7", hl.dsp.exec_cmd("ddcutil --dis=1 setvcp 10 70"))
hl.bind(mainMod .. " + CONTROL + 7", hl.dsp.exec_cmd("ddcutil --dis=2 setvcp 10 70"))
hl.bind(mainMod .. " + CONTROL + 8", hl.dsp.exec_cmd("ddcutil --dis=1 setvcp 10 80"))
hl.bind(mainMod .. " + CONTROL + 8", hl.dsp.exec_cmd("ddcutil --dis=2 setvcp 10 80"))
hl.bind(mainMod .. " + CONTROL + 9", hl.dsp.exec_cmd("ddcutil --dis=1 setvcp 10 90"))
hl.bind(mainMod .. " + CONTROL + 9", hl.dsp.exec_cmd("ddcutil --dis=2 setvcp 10 90"))
hl.bind(mainMod .. " + CONTROL + 0", hl.dsp.exec_cmd("ddcutil --dis=1 setvcp 10 100"))
hl.bind(mainMod .. " + CONTROL + 0", hl.dsp.exec_cmd("ddcutil --dis=2 setvcp 10 100"))

-- change focused workspace
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- change current workspace
for i = 1,10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- scroll to change workspace
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

-- mouse buttons to resize or drag windows
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- volume and music buttons
hl.bind("XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), {
	locked = true,
	repeating = true
})
hl.bind("XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {
	locked = true,
	repeating = true
})
hl.bind("XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {
	locked = true
})
hl.bind("XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), {
	locked = true
})
hl.bind("XF86AudioNext",
	hl.dsp.exec_cmd("playerctl next"), {
	locked = true
})
hl.bind("XF86AudioPause",
	hl.dsp.exec_cmd("playerctl play-pause"), {
	locked = true
})
hl.bind("XF86AudioPlay",
	hl.dsp.exec_cmd("playerctl play-pause"), {
	locked = true
})
hl.bind("XF86AudioPrev",
	hl.dsp.exec_cmd("playerctl previous"), {
	locked = true
})
