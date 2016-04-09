#!/bin/sh

xset -dpms
xset s off

/bin/midori -p -e 'Fullscreen' http://example.com &
exec matchbox-window-manager -use_titlebar no -use_cursor no
