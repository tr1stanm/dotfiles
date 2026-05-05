#!/bin/bash

while [[ $# -gt 0 ]]; do
    case $1 in
        --toggle|-t)
            TOGGLE=1
            shift
            ;;
    esac
done

is_connected() {
    if ip link show nordlynx &>/dev/null; then
        local FULLSTATUS
        local STATUS
        FULLSTATUS=$(nordvpn status)
        STATUS=$(echo "$FULLSTATUS" | grep -o 'Status: [A-Za-z]*' | cut -d' ' -f2)
        [[ "$STATUS" == "Connected" ]]

        IP=$(echo "$FULLSTATUS" | grep -o 'IP: [0-9\.]*' | cut -d' ' -f2)
        CITY=$(echo "$FULLSTATUS" | grep -o 'City: [A-Za-z]*' | cut -d' ' -f2) 
        COUNTRY=$(echo "$FULLSTATUS" | grep -o 'Country: [A-Za-z]*' | cut -d' ' -f2)
        COUNTRYABBREV=$(jq '.[] | select(.country=="'$COUNTRY'").abbreviation' \
            ~/.config/waybar/assets/country-by-abbreviation.json | sed 's/"//g')
    else
        return 1
    fi
}

connect_msg() {
    if is_connected; then
        notify-send "$IP - $CITY, $COUNTRYABBREV"
    else
        notify-send "Disconnected from VPN"
    fi
}

toggle_vpn() {
    if is_connected; then
        nordvpn d > /dev/null
    else
        nordvpn c canada > /dev/null
    fi
}

if [[ -n "$TOGGLE" ]]; then
    toggle_vpn
    connect_msg
    sleep 1
fi

if is_connected; then
    echo '{"text": ""}'
else
    echo '{"text": ""}'
fi
