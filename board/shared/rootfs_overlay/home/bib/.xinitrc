#!/bin/sh

xset -dpms
xset s off

[ -f bib_config ] && . ./bib_config
if [ "x$BIB_CONFIG" == "x" ] ; then
  /usr/bin/midori -p -e 'Fullscreen' $(bib_url) &
else
  /usr/bin/midori -p -e 'Fullscreen' $(bib_url --file="$BIB_CONFIG") &
fi

exec matchbox-window-manager -use_titlebar no
