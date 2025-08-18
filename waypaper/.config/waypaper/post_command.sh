#!/bin/bash
wall="$1"

[[ -z "$wall" ]] && exit 1

wal -i "$wall"

echo "preload = $wall" > ~/.config/hypr/hyprpaper.conf
echo "wallpaper = , $wall" >> ~/.config/hypr/hyprpaper.conf

# pkill waybar && hyprctl dispatch exec waybar
pkill -USR2 waybar
pywalfox update
pkill swaync && swaync
pkill -USR2 btop

~/.config/waypaper/changekeys.sh
~/.config/waypaper/changeborder.sh
~/.config/waybar/scripts/wayveswal.sh
