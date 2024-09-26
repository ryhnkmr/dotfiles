#!/bin/bash

# スクリプトがエラーで停止するように設定
set -e

# ログ表示
echo "---------------------------------------"
echo "       Mac Setup Script Started        "
echo "---------------------------------------"

# Homebrewがインストールされているか確認し、なければインストール
if ! command -v brew &> /dev/null
then
    echo "Homebrewをインストール中..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrewは既にインストールされています。"
fi

# Homebrewのアップデート
echo "Homebrewをアップデート中..."
brew update

# 基本的なツールのインストール
echo "基本的なツールをインストール中..."
brew install git
brew install wget
brew install node
brew install python
brew install jq
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask slack
brew install --cask spotify
brew install --cask google-chrome
brew install --cask arc
brew install --cask docker
brew install --cask dropbox
brew install --cask showyedge
brew install --cask raycast
brew install --cask notion-calendar
brew install --cask notion
brew install --cask warp 
brew install --cask motion # カレンダーアプリ

# パッケージのアップグレード
echo "既存のパッケージをアップグレード中..."
brew upgrade

# 不要なファイルのクリーンアップ
echo "不要なファイルをクリーンアップ中..."
brew cleanup

# Oh My Zshのインストール（オプション）
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zshをインストール中..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zshは既にインストールされています。"
fi

# カスタム設定（例：gitの設定）
echo "Gitのグローバル設定を行います。"
read -p "ユーザー名を入力してください: " git_user
read -p "メールアドレスを入力してください: " git_email

git config --global user.name "$git_user"
git config --global user.email "$git_email"
git config --global core.editor "code --wait"

echo "Gitの設定が完了しました。"

# システム設定の変更

## スクリーンショットの保存先を変更
echo "スクリーンショットの保存先をデスクトップから ~/Screenshots に変更します。"
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots
killall SystemUIServer

## カーソルスピードの最大化
echo "カーソルスピードを最大化します。"
# デフォルトでは3つの設定があり、速さを指定できます（例: 5）
# 高すぎる値を設定すると操作が難しくなる場合があるので注意
defaults write -g com.apple.mouse.scaling 5

## Dockの自動非表示を有効化
echo "Dockを自動非表示に設定します。"
defaults write com.apple.dock autohide -bool true
killall Dock

## スクリーンショットのファイル形式をPNGからJPGに変更
echo "スクリーンショットのファイル形式をJPGに変更します。"
defaults write com.apple.screencapture type jpg
killall SystemUIServer

## Finderで隠しファイルを表示するように設定
echo "Finderで隠しファイルを表示するように設定します。"
defaults write com.apple.finder AppleShowAllFiles -bool true
killall Finder

## デフォルトのスクロール方向を無効化（マウス使用時）
echo "デフォルトのスクロール方向を無効化します。"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

## 自動終了を無効化
echo "自動終了を無効化します。"
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -bool true

# yabaiのインストール
echo "yabaiをインストール中..."
brew install koekeishiya/formulae/yabai

# yabaiの設定ファイル作成
echo "yabaiの設定ファイルを作成中..."
cat <<EOF > ~/.yabairc
#!/bin/bash

# yabaiを起動
brew services start yabai

# キーバインドの設定例
yabai -m config mouse_follows_focus off
yabai -m config focus_follows_mouse autoraise
yabai -m config window_gap 10
yabai -m config top_padding 30
yabai -m config bottom_padding 10
yabai -m config left_padding 10
yabai -m config right_padding 10

# 自動スペース作成の有効化
yabai -m config auto_space on

# yabaiのルール設定
# アプリケーションを特定のスペースに割り当てる
yabai -m rule --add app="Safari" space=1
yabai -m rule --add app="Mail" space=2
yabai -m rule --add app="Notes" space=3
yabai -m rule --add app="Messages" space=4
yabai -m rule --add app="Terminal" space=5
yabai -m rule --add app="Visual Studio Code" space=6
yabai -m rule --add app="Spotify" space=7
yabai -m rule --add app="Slack" space=8
yabai -m rule --add app="Calendar" space=9
EOF

# yabaiの権限設定
echo "yabaiの権限設定を確認してください。"
echo "システム環境設定 > セキュリティとプライバシー > アクセシビリティ にて、yabaiに権限を付与してください。"

# yabaiの再起動
echo "yabaiを再起動します..."
brew services restart yabai

# 仮想デスクトップとアプリの割り当て
echo "仮想デスクトップを作成し、アプリケーションを割り当てます。"
./setup_spaces.sh

# 終了メッセージ
echo "---------------------------------------"
echo "         Mac Setup Script 完了          "
echo "---------------------------------------"

