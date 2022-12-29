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

# set username
git config --global user.email "24nomeniavo@gmail.com"
git config --global user.name "j03-dev"

install_app()

