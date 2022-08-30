# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG $HOME/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set PATH /Users/nakamuraryohei/flutter/bin $PATH
set PATH /usr/local/bin $PATH
set PATH $HOME/.pub-cache/bin $PATH
starship init fish | source

set fish_plugins theme peco

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

function fish_user_key_bindings
  bind \c] peco_change_directory # Bind for prco change directory to Ctrl+]
end
