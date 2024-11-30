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

# Aliases
alias air ~/go/bin/air


# goenvの設定
set -x GOENV_ROOT $HOME/.goenv
set -x PATH $GOENV_ROOT/bin $PATH
set -gx PATH $GOENV_ROOT/shims $PATH

# GOROOT, GOPATHの設定ができていなかった
set -x PATH $GOROOT/bin $PATH
set -x PATH $PATH $GOPATH/bin

# dynamo-db admin
# DYNAMO_ENDPOINT=http://localhost:5000 dynamodb-admin

#mosh stg db
set -x AWS_ACCESS_KEY_ID 
set -x AWS_SECRET_ACCESS_KEY 
set -x AWS_SESSION_TOKEN 
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
