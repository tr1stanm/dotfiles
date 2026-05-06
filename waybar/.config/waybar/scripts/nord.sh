#!/bin/bash

CACHE="/home/tristan/.cache/vpnmonitor/ip_location.txt"
FULLSTATUS=$(nordvpn status)

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
    IP=$(echo "$FULLSTATUS" | grep -o 'IP: [0-9\.]*' | cut -d' ' -f2)
    CITY=$(echo "$FULLSTATUS" | grep -o 'City: [A-Za-z]*' | cut -d' ' -f2) 
    COUNTRY=$(echo "$FULLSTATUS" | grep -o 'Country: [A-Za-z]*' | cut -d' ' -f2)
    COUNTRYABBREV=$(jq '.[] | select(.country=="'$COUNTRY'").abbreviation' \
        ~/.config/waybar/assets/country-by-abbreviation.json | sed 's/"//g')
    IP_AND_LOCATION="$IP - $CITY, $COUNTRYABBREV"
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
        nordvpn c canada > /dev/null
    fi
}

record_connection() {
    if is_connected; then
        if [[ -z "$IP_AND_LOCATION" ]]; then
            get_connection_details
        fi
        echo "$IP_AND_LOCATION" > $CACHE
    fi
}

is_connection_current() {
    if [[ -e "$CACHE" ]]; then
        if [[ $(cat "$CACHE") == "$IP_AND_LOCATION" ]]; then
            return true
        fi
    else
        return false
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

#if [[ -e "$CACHE" ]] && is_connected; then
#    get_connection_details
#    if [[ $(cat $CACHE) == "$IP_AND_LOCATION" ]]; then
#        output
#    else
#        connect_msg
#        output
#    fi
#    exit
#fi

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
