#!/bin/bash

LOCKFILE="$HOME/.config/niri/scripts/.swayidle_toggle.lock"

if pgrep -f "swayidle"; then
    pkill -f "swayidle"
    rm -f "$LOCKFILE"
    notify-send "Auto Suspend" "Auto Suspend is now disabled"
else
    # Start swayidle in background
    swayidle -w \
      timeout 300 'niri msg action power-off-monitors' \
      timeout 330 'swaylock --screenshots --key-hl-color FF8941 --indicator --indicator-radius 150 --clock --fade-in 0.2 --effect-vignette 0.7:0.7 --ring-color FFC041 --effect-blur 10x6 -f' \
      timeout 600 'systemctl suspend' \
      resume 'niri msg action power-off-monitors' \
      before-sleep 'swaylock --screenshots --key-hl-color FF8941 --indicator --indicator-radius 150 --clock --fade-in 0.2 --effect-vignette 0.7:0.7 --ring-color FFC041 --effect-blur 10x6 -f' &
    
    touch "$LOCKFILE"
    notify-send "Auto Suspend" "Auto Suspend is now enabled"
fi