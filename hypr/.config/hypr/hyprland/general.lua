-- monitors
hl.monitor({
    output = "eDP-1",
    mode = "2560x1600@60",
    position = "0x0",
    scale = 1.6,
    reserved_area = { top = -30 }
})

hl.monitor({
    output = "desc:Lenovo Group Limited T24-40 V5WNM516",
    mode = "1920x1080@50",
    position = "-1080x-1440",
    scale = 1,
    transform = 3
})

hl.monitor({
    output = "desc:HP Inc. HP Z27 CN49270NPK",
    mode = "3840x2160@30",
    position = "0x-1440",
    scale = 1.5
})


-- exec-once
hl.on("hyprland.start", function ()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    hl.exec_cmd("systemctl --user start hyprland-session.target")
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
    hl.dispatch(hl.dsp.focus({ workspace = "1" }))
    hl.exec_cmd("hyprpm reload")
end)

hl.on("monitor.added", function()
    hl.exec_cmd("/home/tristan/.config/scripts/monitoring.sh")
    hl.dispatch(hl.dsp.focus({ workspace = "6" }))
    hl.dispatch(hl.dsp.focus({ workspace = "9" }))
end)

-- env var
hl.env("XCURSOR_SIZE", 24)
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- general config
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 0,
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle"
    },
    decoration = {
        rounding = 3,
        rounding_power = 4,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled = false,
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

hl.on("hyprland.shutdown", function()
    os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
    -- uses a blocking exec function and sleeps a bit to give things time to close
    -- you might also want to kill troublesome/crashing non-systemd background services here:
    -- os.execute("pkill wallpaperthing; systemctl --user stop hyprland-session.target && sleep 0.1")
end)
