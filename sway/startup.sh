#!/usr/bin/env bash

#
swaymsg 'exec fcitx -d --replace'

# swaymsg workspace 1 
swaymsg 'workspace 1'

# temp workspace 2
swaymsg 'workspace 2'

# reading workspace
swaymsg 'workspace 3'

# set workspace 1 as home workspace
swaymsg 'workspace number 1'

# start goldendict
# swaymsg 'exec ~/.local/bin/dict.AppImage'

# get wireguard port
# ~/.config/sway/get_wireguard_port.sh