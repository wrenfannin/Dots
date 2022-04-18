#!/bin/bash

# Terminate already running bar instances
killall -q polybar
if type "xrandr"; then
# Run polybar on both monitors  
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi
