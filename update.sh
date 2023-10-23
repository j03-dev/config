#!/bin/bash

cp ~/.tmux.conf .

config=(i3/ nvim/ fish/ polybar/)
for conf in ${config[@]}; do
    cp -r ~/.config/$conf .
done
