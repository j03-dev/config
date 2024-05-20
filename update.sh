#!/bin/bash

cp ~/.tmux.conf .

config=(i3/ fish/ polybar/ helix/)
for conf in ${config[@]}; do
    cp -r ~/.config/$conf .
done
