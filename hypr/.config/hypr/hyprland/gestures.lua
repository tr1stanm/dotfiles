hl.gesture({
    fingers = 4,
    direction = "up",
    action = function()
        hl.plugin.hyprexpo.expo("on")
    end
})
hl.gesture({
    fingers = 4,
    direction = "down",
    action = function()
        hl.plugin.hyprexpo.expo("off")
    end
})
hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace",
    scale = 0.5 })
