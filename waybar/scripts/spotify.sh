#!/bin/bash

# Use playerctl with spotify_player
status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
    artist=$(playerctl metadata artist 2>/dev/null)
    title=$(playerctl metadata title 2>/dev/null)

    if [ "$status" = "Playing" ]; then
        icon="▶"
    else
        icon="⏸"
    fi

    echo "$icon $title - $artist"
else
    echo " Not playing"
fi
