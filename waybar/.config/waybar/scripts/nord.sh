#!/bin/bash

CACHE="/home/tristan/.cache/vpnmonitor/ip_location.txt"
FULLSTATUS=$(nordvpn status)
DEFAULT_COUNTRY="canada"

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
        local STATUS
        STATUS=$(echo "$FULLSTATUS" | grep -o 'Status: [A-Za-z]*' | cut -d' ' -f2)
        [[ "$STATUS" == "Connected" ]]
    else
        return false
    fi
}

get_connection_details() {
    IP=$(echo "$FULLSTATUS" | grep -o 'IP: .*' | cut -d' ' -f2-)
    CITY=$(echo "$FULLSTATUS" | grep -o 'City: .*' | cut -d' ' -f2-) 
    COUNTRY=$(echo "$FULLSTATUS" | grep -o 'Country: .*' | cut -d' ' -f2-)
    COUNTRYABBREV=$(jq '.[] | select(.country=="'$COUNTRY'").abbreviation' \
        ~/.config/waybar/assets/country-by-abbreviation.json | sed 's/"//g')
    if [[ -z $COUNTRYABBREV ]]; then
        COUNTRYABBREV="$COUNTRY"
    fi
    IP_AND_LOCATION=$(echo -e "$CITY, $COUNTRYABBREV\n$IP")
}

connect_msg() {
    if is_connected; then
        get_connection_details
        notify-send "$IP_AND_LOCATION"
    else
        notify-send "Disconnected from VPN"
    fi
}

toggle_vpn() {
    if is_connected; then
        nordvpn d > /dev/null
    else
        nordvpn c "$DEFAULT_COUNTRY" > /dev/null
    fi
}

record_connection() {
    if is_connected; then
        if [[ -z "$IP_AND_LOCATION" ]]; then
            get_connection_details
        fi
        echo -e "$IP_AND_LOCATION" > $CACHE
    fi
}

output() {
    if is_connected; then
        echo '{"text": ""}'
    else
        echo '{"text": ""}'
    fi
}

if [[ -n "$TOGGLE" ]]; then
    toggle_vpn
    record_connection
    sleep 1
fi

if is_connected; then
    get_connection_details
    if [[ $(cat $CACHE) == "$IP_AND_LOCATION" ]]; then
        output
    else
        sleep 1
        connect_msg
        record_connection
        output
    fi
else
    if [[ -e $CACHE ]]; then
        connect_msg
        rm $CACHE
    fi
    output
fi
