#!/usr/bin/env bash

xcompmgr &
trayer --edge top --align right --expand true --widthtype request --transparent true --tint 0 &
nm-applet &
cbatticon &
pnmixer &
