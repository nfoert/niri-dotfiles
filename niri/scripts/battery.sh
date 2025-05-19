#!/bin/bash

# Detect battery directory (usually BAT0)
BATTERY_DIR=$(find /sys/class/power_supply/ -name "BAT*" | head -n1)

# Exit if no battery is found
if [ -z "$BATTERY_DIR" ]; then
    echo "No battery found."
    exit 1
fi

CURRENT_BRIGHTNESS=$(brightnessctl get)
LAST_PERCENT=-1
LAST_STATUS=""
LOWERED_BRIGHTNESS=true

while true; do
    # Read charge level
    CHARGE_NOW=$(cat "$BATTERY_DIR/charge_now" 2>/dev/null || cat "$BATTERY_DIR/energy_now")
    CHARGE_FULL=$(cat "$BATTERY_DIR/charge_full" 2>/dev/null || cat "$BATTERY_DIR/energy_full")
    STATUS=$(cat "$BATTERY_DIR/status")

    if [ "$CHARGE_FULL" -eq 0 ]; then
        echo "Invalid full charge value (0). Exiting..."
        exit 1
    fi

    PERCENT=$((100 * CHARGE_NOW / CHARGE_FULL))

    if [ "$PERCENT" -le 20 ] && ( [ "$LAST_PERCENT" -gt 20 ] || [ "$LAST_PERCENT" -eq -1 ] ); then
        notify-send "Low battery" "Remaining charge: $PERCENT%"

    elif [ "$PERCENT" -le 10 ] && ( [ "$LAST_PERCENT" -gt 10 ] || [ "$LAST_PERCENT" -eq -1 ] ); then
        CURRENT_BRIGHTNESS=$(brightnessctl get)
        notify-send -t 0 "Critical battery level" "Remaining charge: $PERCENT%"
        brightnessctl set 15%
        LOWERED_BRIGHTNESS=true

    elif [ "$PERCENT" -le 2 ] && ( [ "$LAST_PERCENT" -gt 2 ] || [ "$LAST_PERCENT" -eq -1 ] ); then
        notify-send -t 0 "Hibernating due to critical battery level" "Remaining charge: $PERCENT%"
        systemctl hibernate

    elif [ "$STATUS" = "Charging" ] && [ "$LAST_STATUS" != "Charging" ] && [ "$LOWERED_BRIGHTNESS" = true ]; then
        brightnessctl set "$CURRENT_BRIGHTNESS"
        LOWERED_BRIGHTNESS=false
    fi

    LAST_PERCENT=$PERCENT
    LAST_STATUS=$STATUS

    # Sleep for 20 seconds
    sleep 20
done
