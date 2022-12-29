#!/bin/bash

install_app(){
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install -y git fish nmap \
        aircrack-ng \
        john i3 curl \
        python3-pip \
        vim nvim\
        polybar 
}

copy_dot_file(){
    cp -r fish/ i3/ nvim/ polybar/ ~/.config/;
    cp .tmux.conf ~/.tmux.conf
}

# set git config
git config --global user.email "24nomeniavo@gmail.com"
git config --global user.name "j03-dev"

# install_app
copy_dot_file

