#!/bin/bash

# Pull Pywal colors
COLOR6=$(sed -n '7p' ~/.cache/wal/colors)       # Typically an accent (color6)
BACKGROUND=$(sed -n '1p' ~/.cache/wal/colors)   # Background (color0)

WAYBAR_CSS="$HOME/.config/waybar/style.css"

# Remove old blocks (if any)
sed -i '/#custom-wayves_left {/,/}/d' "$WAYBAR_CSS"
sed -i '/#custom-wayves_right {/,/}/d' "$WAYBAR_CSS"

# Append new color blocks
cat >> "$WAYBAR_CSS" <<EOF

#custom-wayves_left,
#custom-wayves_right {
  color: $COLOR6;
}
EOF
