starship init fish | source

export PATH="/usr/sbin:$PATH"

# if status is-interactive
# and not set -q TMUX
#     exec tmux
# end

# Define the function to run your desired command
function fish_user_key_bindings
    # Bind Ctrl+f to the command
    bind \cf 'hx (fzf --preview="bat {}")'
end

# Call the function to apply the key bindings
fish_user_key_bindings

# enable vim mode
fish_vi_key_bindings

export EDITOR=/usr/bin/hx

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set --export PATH "/home/joe/.kotlin/bin" $PATH

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

zoxide init fish | source

export PATH="$HOME/.tmuxifier/bin:$PATH"

# alias
alias wrkspc="tmuxifier s workspace"
alias zellij="zellij options --theme nord"


# Android setup
export ANDROID_HOME="$HOME/Android"
export ANDROID_SDK="$ANDROID_HOME/Sdk"
export NDK_HOME="$ANDROID_HOME/Ndk"
export PATH="$ANDROID_SDK/emulator:$PATH "
export PATH="$ANDROID_SDK/platform-tools:$PATH"
export PATH="$PATH:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$NDK_HOME"

export PATH="$ANDROID_HOME/Fdk/bin:$PATH " # flutter 
export PATH="$PATH:/usr/local/go/bin" # go
export PATH="$PATH:$HOME/go/bin" # go bin installation

# export tools
export TOOL="/home/joe/Tools"
export PATH="$TOOL:$PATH"

# setup oracle client
export ORACLE_HOME="$TOOL/instantclient_11_2"
export LD_LIBRARY_PATH="$ORACLE_HOME:$LD_LIBRARY_PATH"
export PATH="$ORACLE_HOME:$PATH"

export DENO_INSTALL="/home/joe/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
