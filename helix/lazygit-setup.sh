#!/usr/bin/env bash
# ~/.cargo/bin/zellij run -f -x 10% -y 10% --width 80% --height 80% -- 
lazygit
zellij action toggle-floating-panes
zellij action write 27 # send <Escape> key
zellij action write-chars ":reload-all"
zellij action write 13 # send <Enter> key
zellij action toggle-floating-panes
zellij action close-pane
