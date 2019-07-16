#!/usr/bin/env bash
$HOME/.screenlayout/default.sh
xcompmgr &
trayer --edge top --align right --expand true --widthtype request --transparent true --tint 0 &
nm-applet &
cbatticon &
pnmixer &
xwinwrap -fs -b -ov -- mpv ~/Pictures/background.mp4 --wid WID --loop --no-osc --no-osd-bar &
xscreensaver --no-splash &
