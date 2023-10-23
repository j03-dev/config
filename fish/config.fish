# thefuck --alias | source
# if status is-interactive
# and not set -q TMUX
#     exec tmux
# end

# enable vim mode
fish_vi_key_bindings

# setup rust env
export PATH="$PATH:/$HOME/.cargo/bin/"

export PATH="$PATH:/$HOME/.tmuxifier/bin"

# export flutter
# export ANDROID_HOME=$HOME/Android/Sdk
export PATH="$PATH:$HOME/flutter_linux/flutter/bin/"
# export PATH="$PATH:$ANDROID_HOME/cmdline-tools/bin/"
# export PATH="$PATH:$HOME/.gradle/wrapper/dists/gradle-7.4-all/aadb4xli5jkdsnukm30eibyiu/gradle-7.4/bin"

# Alias
alias project "cd /mnt/d/Project"
alias d "cd /mnt/d"
alias boto "tmuxifier s boto-session"
alias metyamiko "tmuxifier s metyamiko-session"

export EDITOR=/usr/bin/hx

export JAVA_HOME="/home/j03/jdk-20.0.1"
export PATH="$JAVA_HOME/bin:$PATH"


# Add to shell environment
# export http_proxy=http://26.26.26.1:8080
# export https_proxy=https://26.26.26.1:8080

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
