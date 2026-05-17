#!/bin/bash
WALLPAPER="/home/ricedev/Pictures/wallpapers/wall-1.jpg"

# Attendre que Hyprland soit prêt
sleep 1
hyprpaper &
sleep 1

# Appliquer via IPC comme le fait wallpaper.sh
hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper "eDP-1,$WALLPAPER"
