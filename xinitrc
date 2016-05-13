/usr/bin/xset -b
/usr/bin/xrandr --output DVI-0 --left-of DVI-1 --auto
/usr/bin/xrandr --output DVI-1 --right-of DVI-0 --auto
/usr/bin/pulseaudio -D &
/usr/bin/xrdb .xtermrc
/usr/bin/devmon &
/usr/bin/stalonetray &
#/usr/bin/unagi &
/usr/bin/nm-applet &
/usr/bin/xmonad

