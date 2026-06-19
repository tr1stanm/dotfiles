-- monitors
hl.monitor({
    output = "eDP-1",
    mode = "2560x1600@60",
    position = "auto",
    scale = 1.6
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
