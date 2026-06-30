-- migration from hyprlang
package.path = package.path .. ";" .. "/home/tristan/.config/hypr/hyprspace/?.lua"

require("hyprland.general")
require("hyprland.workspaces")
require("hyprland.bindings")
require("hyprland.windowrules")
require("hyprland.animations")
require("hyprland.touchpad")
require("hyprland.gestures")
require("hyprland.plugins")
