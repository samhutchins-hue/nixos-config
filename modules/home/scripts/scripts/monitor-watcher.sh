#!/usr/bin/env bash

# based on https://github.com/ash-17/omarchy-external-monitor

restart-apps() {
    pkill .awww-daemon-wr 2> /dev/null
    init-wallpaper &

    pkill .waybar-wrapped 2> /dev/null
    waybar &

    pkill .swayosd-server 2> /dev/null
    swayosd-server &
}

handle-monitor-state() {
    external_present=$(hyprctl monitors | grep -E "^Monitor (HDMI-|DP-)" || true)
    enabled_count=$(hyprctl monitors | grep -c "^Monitor")

    if [ -n "$external_present" ]; then
        if [ "$enabled_count" -gt 1 ]; then
            hyprctl keyword monitor "eDP-1,disable"
        fi
    else
        hyprctl keyword monitor "eDP-1,preferred,auto,1"
    fi
}

sleep 1
handle-monitor-state
restart-apps

socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" |
    while read -r line; do
        if echo "$line" | grep -qE "monitor(added|removed)>>(HDMI-|DP-)|configreloaded"; then
            handle-monitor-state
            restart-apps
        fi
    done
