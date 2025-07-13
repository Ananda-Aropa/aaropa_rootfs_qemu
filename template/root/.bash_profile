#!/bin/bash

# Run autostart scripts
for script in ~/.config/autostart/*.sh; do
  if [ -x "$script" ]; then
    "$script" &
  fi
done

# Reload input devices
udevadm trigger

# Run oem-install if OEM is set
/usr/sbin/oem-install

# Force Qt apps to use GTK3
export QT_QPA_PLATFORMTHEME=gtk3

# Start X11 if not running
if [ -z "$DISPLAY" ] && ! pidof X; then
  startx /usr/bin/jwm
fi

# Print message when no jwm
clear

cat /etc/bliss/message.txt
