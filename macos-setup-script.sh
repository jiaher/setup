#!/usr/bin/env bash
# Setup script for setting up a new macos machine


echo "Starting setup"
# install xcode CLI
xcode-select --install


# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Add prompt to shell
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

# Update homebrew recipes
brew update


# Install GNU core utilities (those that come with OS X are outdated)
# brew tap homebrew/dupes this is deprecated
brew install coreutils
brew install gnu-sed
brew install gnu-tar
brew install gnu-indent
brew install gnu-which
brew install grep

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash



PACKAGES=(
    git
    npm
    nvm
    wget
    tmux
)
echo "Installing packages..."
brew install ${PACKAGES[@]}
# any additional steps you want to add here
# link readline
brew link --force readline

echo "Cleaning up..."
brew cleanup

## Homebrew Cask graphical app installer

echo "Installing cask..."
brew install cask

CASKS=(
    app-cleaner
    canva
    daisydisk
    discord
    freetube
    google-chrome
    google-drive
    itsycal
    ledger-live
    jellyfin-media-player
    microsoft-auto-update
    microsoft-edge
    microsoft-teams
    miro
    notion
    numi
    obsidian
    onedrive
    philips-hue-sync
    plex
    raycast
    rectangle
    slack
    stats
    telegram
    tradingview
    transmission
    the-unarchiver
    visual-studio-code
    warp
    whatsapp
    zoom
    )
echo "Installing cask apps..."
brew install --cask ${CASKS[@]}

# set shortcut to VS Code
cat << EOF >> ~/.bash_profile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF


echo "Your mac setup is completed!"
