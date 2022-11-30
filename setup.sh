sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y git fish nmap \
    aircrack-ng \
    john i3 curl \
    python3-pip \
    vim nvim\
    polybar \

# copy config file to /home/user/.config
cp -r fish i3 nvim polybar ~/.config/
cp .tmux ~/.tmux.conf
