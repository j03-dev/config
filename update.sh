#!/bin/bash

cp ~/.tmux.conf .

config=(i3 fish helix fastfetch libinput-gestures.conf picom.conf zellij hypr)

for conf in ${config[@]}; do
    cp -r ~/.config/$conf .
done
