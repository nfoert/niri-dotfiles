#!/bin/bash

players=$(playerctl -l 2>/dev/null)

# If no players available
if [ -z "$players" ]; then
    echo " Not playing"
    exit 0
fi

playing_count=0
paused_count=0
playing_players=()
latest_player=""

# Check each player's status
for player in $players; do
    status=$(playerctl -p "$player" status 2>/dev/null)

    if [ "$status" = "Playing" ]; then
        playing_count=$((playing_count+1))
        playing_players+=("$player")
        latest_player="$player"  # last seen "Playing" becomes most recent
    elif [ "$status" = "Paused" ]; then
        paused_count=$((paused_count+1))
    fi
done

player_count=$(echo "$players" | wc -w)

if [ "$player_count" -eq 1 ]; then
    # Only one player
    status=$(playerctl -p "$players" status 2>/dev/null)
    artist=$(playerctl -p "$players" metadata artist 2>/dev/null)
    title=$(playerctl -p "$players" metadata title 2>/dev/null)

    if [ "$status" = "Playing" ]; then
        echo "▶ $title - $artist"
    elif [ "$status" = "Paused" ]; then
        echo " $title - $artist (paused)"
    else
        echo " Not playing"
    fi

else
    # Multiple players
    if [ "$playing_count" -eq 1 ]; then
        # Only one playing
        player="${playing_players[0]}"
        artist=$(playerctl -p "$player" metadata artist 2>/dev/null)
        title=$(playerctl -p "$player" metadata title 2>/dev/null)
        echo "▶ $title - $artist"
    elif [ "$playing_count" -eq 0 ]; then
        # None playing
        echo " $paused_count paused"
    else
        # More than one playing → show most recent
        artist=$(playerctl -p "$latest_player" metadata artist 2>/dev/null)
        title=$(playerctl -p "$latest_player" metadata title 2>/dev/null)
        echo "▶ $title - $artist"
    fi
fi
