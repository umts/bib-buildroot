#!/bin/sh

xset -dpms
xset s off

/bin/midori -p -e 'Fullscreen' $(bib_url) &
exec matchbox-window-manager -use_titlebar no
