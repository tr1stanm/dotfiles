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
        local STATUS
        STATUS=$(nordvpn status | grep -o 'Status: [A-Za-z]*' | cut -d' ' -f2)
        [[ "$STATUS" == "Connected" ]]
    else
        return 1
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
    sleep 1
fi

if is_connected; then
    echo '{"text": ""}'
else
    echo '{"text": ""}'
fi
