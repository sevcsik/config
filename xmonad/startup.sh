#!/usr/bin/env bash
$HOME/.screenlayout/default.sh
$HOME/.screenlayout/background.sh
xcompmgr &
trayer --edge top --align right --expand true --widthtype request --transparent true --tint 0 &
nm-applet &
cbatticon &
pnmixer &
xscreensaver -no-splash &
