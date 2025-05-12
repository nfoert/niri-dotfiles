#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Transition settings (optional)
TRANSITION_TYPE="wipe"
TRANSITION_ANGLE="30"
TRANSITION_DURATION="1" # in seconds

# Start swww daemon if not running
if ! pgrep -x "swww-daemon" > /dev/null; then
    echo "Starting swww-daemon..."
    swww-daemon
fi

# Get a list of image files
mapfile -t IMAGES < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \))

# Exit if no images found
if [ ${#IMAGES[@]} -eq 0 ]; then
    echo "No images found in $WALLPAPER_DIR"
    exit 1
fi

# Pick a random image
RANDOM_IMAGE="${IMAGES[RANDOM % ${#IMAGES[@]}]}"

# Set the wallpaper
swww img "$RANDOM_IMAGE" --transition-type "$TRANSITION_TYPE" --transition-duration "$TRANSITION_DURATION" --transition-angle "$TRANSITION_ANGLE" --resize crop
notify-send "Wallpaper changed" "$RANDOM_IMAGE"

