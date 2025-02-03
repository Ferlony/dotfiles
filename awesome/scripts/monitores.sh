#!/bin/sh
intern=eDP1
extern=HDMI2

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto --scale 1x1 --mode 1920x1080
else
    xrandr --output $intern --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output $extern --mode 1920x1080 --brightness 1.0 --pos 0x0 --rotate normal --output VIRTUAL1 --off 

fi
