#!/usr/bin/env bash

WAL_CACHE="$HOME/.cache/wal/colors.json"
SPICE_THEME_DIR="$HOME/.config/spicetify/Themes/pywal"
COLOR_INI="$SPICE_THEME_DIR/color.ini"

jq -r '
  .colors | to_entries |
  map("\(.key)=\(.value)")[]' "$WAL_CACHE" > "$SPICE_THEME_DIR/colors_raw.txt"

cat > "$COLOR_INI" <<EOF
[Base]
text               = $(grep color15 "$SPICE_THEME_DIR/colors_raw.txt" | cut -d= -f2)
subtext            = $(grep color7  "$SPICE_THEME_DIR/colors_raw.txt" | cut -d= -f2)
main               = $(grep color0  "$SPICE_THEME_DIR/colors_raw.txt" | cut -d= -f2)
sidebar            = $(grep color1  "$SPICE_THEME_DIR/colors_raw.txt" | cut -d= -f2)
player             = $(grep color2  "$SPICE_THEME_DIR/colors_raw.txt" | cut -d= -f2)
card               = $(grep color3  "$SPICE_THEME_DIR/colors_raw.txt" | cut -d= -f2)
shadow             = $(grep color8  "$SPICE_THEME_DIR/colors_raw.txt" | cut -d= -f2)
selected-row       = $(grep color5  "$SPICE_THEME_DIR/colors_raw.txt" | cut -d= -f2)
button             = $(grep color4  "$SPICE_THEME_DIR/colors_raw.txt" | cut -d= -f2)
tab-active         = $(grep color6  "$SPICE_THEME_DIR/colors_raw.txt" | cut -d= -f2)
EOF

spicetify config current_theme pywal
spicetify apply
