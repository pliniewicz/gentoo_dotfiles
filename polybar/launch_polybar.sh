#!/bin/sh

killall -q polybar

# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload main &
#   done
# else
#   polybar main & disown
# fi

polybar main &
polybar support &

#for m in $(polybar --list-monitors | cut -d":" -f1); do
#    MONITOR=$m polybar --reload main &
#done
