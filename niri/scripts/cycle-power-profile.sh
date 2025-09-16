#!/usr/bin/env bash

# Get profiles: only lines that start with space or * followed by a word and colon
profiles=(power-saver balanced performance)

# Get current profile
current=$(powerprofilesctl list | grep '^\*' | awk -F: '{print $1}' | sed 's/[* ]//g')

# Find current index
for i in "${!profiles[@]}"; do
    if [[ "${profiles[$i]}" == "$current" ]]; then
        current_index=$i
        break
    fi
done

# Compute next index (wrap around)
next_index=$(( (current_index + 1) % ${#profiles[@]} ))

# Switch profile
next_profile="${profiles[$next_index]}"
powerprofilesctl set "$next_profile"

notify-send "Power profile changed" "$next_profile"