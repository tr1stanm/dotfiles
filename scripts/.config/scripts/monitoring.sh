#/bin/bash
left=$(hyprctl monitors | grep -A 2 'Monitor DP' | grep -B 2 'V5WNM516')

top=$(hyprctl monitors | grep -A 2 'Monitor DP' | grep -B 2 'CN49270NPK')

if [[ -n $left ]]; then
    echo $left > /home/tristan/.cache/monitoring/left.txt
else
    rm /home/tristan/.cache/monitoring/left.txt
fi

if [[ -n $top ]]; then
    echo $top > /home/tristan/.cache/monitoring/top.txt
else
    rm /home/tristan/.cache/monitoring/top.txt
fi
    
