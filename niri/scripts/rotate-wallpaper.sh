#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Transition settings
TRANSITION_TYPE="any"
TRANSITION_DURATION="1" # seconds

# Time between changes (30 minutes)
INTERVAL=$((30 * 60))

# Start swww daemon if not already running
if ! pgrep -x "swww-daemon" > /dev/null; then
    echo "Starting swww-daemon..."
    swww init
    sleep 1 # Give the daemon a moment to start
fi

change_wallpaper() {
    mapfile -t IMAGES < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \))

    if [ ${#IMAGES[@]} -eq 0 ]; then
        echo "No images found in $WALLPAPER_DIR"
        exit 1
    fi

    RANDOM_IMAGE="${IMAGES[RANDOM % ${#IMAGES[@]}]}"
    swww img "$RANDOM_IMAGE" --transition-type "$TRANSITION_TYPE" --transition-duration "$TRANSITION_DURATION"
    echo "Wallpaper changed to: $RANDOM_IMAGE"
}

# Wait a few seconds if just started swww
sleep 2

# Main loop
while true; do
    change_wallpaper
    sleep "$INTERVAL"
done
