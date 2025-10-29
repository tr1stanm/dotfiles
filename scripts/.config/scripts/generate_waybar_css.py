#!/usr/bin/env python3
import json
import os

# Paths
wal_colors = os.path.expanduser("~/.cache/wal/colors.json")
css_output = os.path.expanduser("~/.config/waybar/style.css")

# Load Pywal colors
with open(wal_colors) as f:
    colors = json.load(f)

def hex_to_rgb(hex_color):
    hex_color = hex_color.lstrip("#")
    return tuple(int(hex_color[i:i+2], 16) for i in (0,2,4))

# Determine main colors safely
if "colors" in colors:
    col = colors["colors"]
elif "special" in colors:
    col = colors["special"]
else:
    raise KeyError("Cannot find colors in wal JSON")

def get_color(key, default="#000000"):
    return hex_to_rgb(col.get(key, default))

bg = get_color("background", "#1e1e2e")
fg = get_color("foreground", "#cdd6f4")
c7 = get_color("color7", "#cdd6f4")
c9 = get_color("color9", "#f38ba8")

# Generate formatted CSS
css = f"""/* ================================
   Fallback colors for Pywal
   ================================ */
@define-color background rgb({bg[0]},{bg[1]},{bg[2]});
@define-color foreground rgb({fg[0]},{fg[1]},{fg[2]});
@define-color color7 rgb({c7[0]},{c7[1]},{c7[2]});
@define-color color9 rgb({c9[0]},{c9[1]},{c9[2]});



/* ================================
   Your Waybar styling
   ================================ */
* {{
    font-size: 18px;
    font-family: "Agave Nerd Font Propo";
}}


window#waybar {{
    all: unset;
}}


.modules-left,
.modules-center,
.modules-right {{
    padding: 7px 10px;
    margin: 10px 10px 5px 10px;
    border-radius: 10px;
    background: rgba({bg[0]},{bg[1]},{bg[2]},0.6);
    box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
}}


/* Tooltip */
tooltip {{
    background: rgb({bg[0]},{bg[1]},{bg[2]});
    color: rgb({c7[0]},{c7[1]},{c7[2]});
}}


/* Hoverable modules */
#clock:hover,
#custom-pacman:hover,
#custom-notification:hover,
#bluetooth:hover,
#network:hover,
#battery:hover,
#cpu:hover,
#memory:hover,
#temperature:hover {{
    transition: all .3s ease;
    color: rgb({c9[0]},{c9[1]},{c9[2]});
}}


/* Clock, notification, and pacman */
#clock, #custom-notification, #custom-pacman,
#bluetooth, #network, #battery, #cpu, #memory, #temperature, #mpris {{
    padding: 0px 5px;
    color: rgb({c7[0]},{c7[1]},{c7[2]});
    transition: all .3s ease;
}}


/* Battery states */
#battery.charging {{ color: #26A65B; }}
#battery.warning:not(.charging) {{ color: #ffbe61; }}
#battery.critical:not(.charging) {{
    color: #f53c3c;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}}


/* Workspaces */
#workspaces {{ padding: 0px 5px; }}
#workspaces button {{
    all: unset;
    padding: 0px 5px;
    color: rgba({c9[0]},{c9[1]},{c9[2]},0.4);
    transition: all .2s ease;
}}
#workspaces button:hover {{ 
    color: rgba(0,0,0,0); 
    border: none; 
    text-shadow: 0px 0px 1.5px rgba(0,0,0,.5); 
    transition: all 1s ease; 
}}
#workspaces button.active {{ 
    color: rgb({c9[0]},{c9[1]},{c9[2]}); 
    border: none; 
    text-shadow: 0px 0px 2px rgba(0,0,0,.5); 
}}
#workspaces button.empty {{ 
    color: rgba(0,0,0,0); 
    border: none; 
    text-shadow: 0px 0px 1.5px rgba(0,0,0,.2); 
}}
#workspaces button.empty:hover {{ 
    color: rgba(0,0,0,0); 
    border: none; 
    text-shadow: 0px 0px 1.5px rgba(0,0,0,.5); 
    transition: all 1s ease; 
}}
#workspaces button.empty.active {{ 
    color: rgb({c9[0]},{c9[1]},{c9[2]}); 
    border: none; 
    text-shadow: 0px 0px 2px rgba(0,0,0,.5); 
}}


/* Tray */
#tray,
#tray menu *,
#tray menu separator {{
    padding: 0px 5px;
    transition: all .3s ease;
}}


/* Custom expand module */
#custom-expand {{
    padding: 0px 5px;
    color: rgba({c7[0]},{c7[1]},{c7[2]},.2);
    text-shadow: 0px 0px 2px rgba(0,0,0,.7);
    transition: all .3s ease;
}}
#custom-expand:hover {{
    color: rgba(255,255,255,.2);
    text-shadow: 0px 0px 2px rgba(255,255,255,.5);
}}

/* Custom cava module */
#custom-cava {{
    padding: 0px 5px;
    transition: all .3s ease;
    color: rgb({c7[0]},{c7[1]},{c7[2]});
}}
#custom-cava:hover {{
    color: rgb({c9[0]},{c9[1]},{c9[2]});
}}


/* Custom endpoint & color picker */
#custom-endpoint {{ color: transparent; text-shadow: 0 0 1.5px rgba(0,0,0,1); }}
#custom-colorpicker {{ padding: 0px 5px; }}
"""

# Write to file
with open(css_output, "w") as f:
    f.write(css)

print(f"Waybar CSS auto-generated at {css_output}")

