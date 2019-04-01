#!/bin/bash
# poll until connection to a vpn is complete
# https://superuser.com/questions/358513/start-configured-vpn-from-command-line-osx

printf "Connecting to VPN \n"

function isnt_connected() {
    scutil --nc status "$DEFAULT_VPN" | sed -n 1p | grep -qv Connected
}

function poll_until_connected() {
    let loops=0 || true
    let max_loops=200 # 200 * 0.1 is 20 seconds

    while isnt_connected "$DEFAULT_VPN"; do
        sleep 0.1 # can't use a variable here, bash doesn't have floats
        let loops=$loops+1
        [ $loops -gt $max_loops ] && break
    done

    [ $loops -le $max_loops ]
}

# Make sure the expected PATH var is set
if [ -z "$DEFAULT_VPN" ] 
    then
        printf "DEFAULT_VPN is not set in the path."
        exit 1
fi

scutil --nc start "$DEFAULT_VPN"

if poll_until_connected "$DEFAULT_VPN";
    then
        printf "Connected to $DEFAULT_VPN!"
        exit 0
else
    printf "Timed out attempting to connect to the default VPN"
    scutil --nc stop "$DEFAULT_VPN"
    exit 1
fi
