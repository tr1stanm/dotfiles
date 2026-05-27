-- monitors
hl.monitor({
    output = "DP-1",
    mode = "3840x2160@60",
    position = "auto",
    scale = 1.5
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "highres",
    position = "auto-left",
    scale = 1,
    transform = 3
})

-- exec-once
hl.on("hyprland.start", function ()
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("waybar")
    hl.exec_cmd("systemctl --user restart wallpaper-loop.service")
    hl.exec_cmd("systemctl --user restart stash-music.service")
    hl.exec_cmd("systemctl --user enable --now easyeffects.service")
    hl.exec_cmd("/home/tristan/.config/scripts/changegifservice.sh")
    hl.exec_cmd("iwctl station wlan0 scan")
    hl.exec_cmd("nordvpn c canada")
end)

-- env var
hl.env("XCURSOR_SIZE", 24)

-- gpu paths. enabling igpu for hyprland so it's being used for something
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")

-- general config
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 0,
        col = {
            active_border = { colors = { "rgb(acd9e0)", "rgb(52BDCE)", angle = 45 }},
            inactive_border = "rgb(0194AA)"
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle"
    },
    decoration = {
        rounding = 8,
        rounding_power = 4,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled = true,
            size = 7,
            passes = 1,
            vibrancy = 0.1696,
            contrast = 1.5
        }
    },
    dwindle = {
        preserve_split = true
    },
    master = {
        new_status = "master"
    }
})
