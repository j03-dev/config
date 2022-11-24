# thefuck --alias | source

if status is-interactive
and not set -q TMUX
    exec tmux
end

# enable vim mode
fish_vi_key_bindings

export PATH="$PATH:/home/j03/.cargo/bin/"
export PATH="$PATH:/opt/bin/Typora-linux-x64/"
export PATH="$PATH:/mnt/D/Tools/LinuxApp/bin"

## export flutter
export ANDROID_HOME=/home/j03/Android/Sdk
export PATH="$PATH:/home/j03/Flutter/flutter/bin/"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/bin/"

# export command
export PATH="$PATH:/mnt/D/Project/pybuild/"
export PATH="$PATH:/mnt/D/Project/convert_image_to_pdf/"

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# color output
set -U grcplugin_ls --color -l
set -U grc_plugin_execs gcc g++ make

#configure my promt fish
#### Enable the time to be displayed.
set -g theme_display_time yes

#### Disable playing the user's current group.
set -g theme_display_group yes

### Display the system hostname.
set -g theme_display_hostname yes

#### Disable Git-awareness.
set -g theme_display_git yes

#### Don't disable jobs indicator.
set -g theme_display_jobs no

#### Always display the jobs indicator, even if there are no jobs.
set -g theme_display_jobs_always yes

#### Hide the current directory read/write indicator.
set -g theme_display_rw yes

#### Don't display the VirtualEnv prompt.
set -g theme_display_virtualenv yes

#### Display the battery
set -g theme_display_batt no
set -g theme_display_batt_icon no


set theme_primary                                   1eb980
set theme_secondary                                 ffcf44
set theme_primary_variant                           045d56
set theme_secondary_variant                         ff6859
set theme_hilight                                   b15dff

set -g theme_color_user                             $theme_hilight
set -g theme_color_host                             $theme_primary_variant
set -g theme_color_separator                        brblack
set -g theme_color_normal                           normal
set -g theme_color_time                             $theme_secondary_variant
set -g theme_color_path                             $theme_primary
set -g theme_color_prompt                           $theme_secondary_variant
set -g theme_color_virtualenv                       $theme_secondary
set -g theme_color_status_prefix                    $theme_hilight
set -g theme_color_status_jobs                      $theme_primary
set -g theme_color_status_rw                        $theme_primary
set -g theme_display_group                          no
set -g theme_prompt_segment_separator_color         $theme_primary
set -g theme_prompt_userhost_separator              '.'
set -g __fish_git_prompt_char_branch_begin          '['
set -g __fish_git_prompt_char_branch_end            ']'
set -g __fish_git_prompt_color_branch_begin         brblack
set -g __fish_git_prompt_color_branch_end           brblack
set -g __fish_git_prompt_color_branch               $theme_secondary

set -gx fish_prompt_pwd_dir_length                  1
set -g theme_display_jobs_always                    yes

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /home/j03/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

