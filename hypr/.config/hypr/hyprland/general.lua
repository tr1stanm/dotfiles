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
    hl.exec_cmd("nordvpn c canada")
end)

-- env vars. don't really know if it's necessary but idk default cursor size so
hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)

-- general config
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = { colors = { "rgb(d4d9d8)", "rgb(5CB5C3)", angle = 45 }},
            inactive_border = "rgb(7B7EAC)"
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle"
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)"
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696
        }
    },
    dwindle = {
        preserve_split = true
    },
    master = {
        new_status = "master"
    }
})
