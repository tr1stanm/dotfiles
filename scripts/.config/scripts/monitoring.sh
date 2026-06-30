#/bin/bash
lefts=$(hyprctl monitors | grep -A 2 'Monitor DP' | grep -B 2 'V5WNM516' | grep -oE DP-[0-9].?)
tops=$(hyprctl monitors | grep -A 2 'Monitor DP' | grep -B 2 'CN49270NPK' | grep -oE DP-[0-9].?)
left=$(echo $lefts | xargs)
top=$(echo $tops | xargs)

touch /home/tristan/.cache/waybar.tmp

if [[ -n $left ]]; then
    jq --arg topmon "$top" '
        map(
            if .name == "monitor-2"
            then .output = $topmon
            else .
            end
        )
    ' /home/tristan/.config/waybar/config > /home/tristan/.cache/waybar.tmp
fi

if [[ -n $top ]]; then
    jq --arg leftmon "$left" '
        map(
            if (.name == "monitor-3-top" or .name == "monitor-3-bottom")
            then .output = $leftmon
            else .
            end
        )
    ' /home/tristan/.cache/waybar.tmp > /home/tristan/.config/waybar/config
fi
