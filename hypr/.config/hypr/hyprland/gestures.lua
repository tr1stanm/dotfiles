--local hyprspace = require("hyprspace.Hyprspace")

--hl.gesture({
--    fingers = 4,
--    direction = "up",
--    action = function()
--        hyprspace.overview("open")
--    end
--})
--hl.gesture({
--    fingers = 4,
--    direction = "down",
--    action = function()
--        hyprspace.overview("close")
--    end
--})
hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace",
    scale = 0.5 })
hl.gesture({
    fingers = 2,
    direction = "left",
    action = function()
        hl.dsp.exec_cmd("swaync-client -op")
    end
})
