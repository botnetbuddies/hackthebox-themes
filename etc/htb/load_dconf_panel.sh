#!/bin/bash
sudo -u $(whoami) dbus-launch dconf load /org/mate/panel/ < /etc/htb/.dconf_panel
dconf load /org/mate/panel/ < /etc/htb/.dconf_panel
sudo killall mate-panel
