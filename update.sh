#!/bin/bash

cp ~/.tmux.conf .

config=(i3/ fish/ helix/ fastfetch/ libinput-gestures.conf picom.conf)

for conf in ${config[@]}; do
    cp -r ~/.config/$conf .
done
