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
    markdown
    npm
    nvm
    python
    wget
    tmux
    dotnet
    docker
    azure-cli
	pyenv
	node
	typescript

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
    ##google-drive
    ##macdown
    ##onedrive
    ##postgres
    aerial
    alfred
    anaconda
    bitwarden
    cheatsheet
    ##fliqlo
    google-chrome
    itsycal
    iterm2
    microsoft-edge
    miro
    numi
    ##philips-hue-sync
    plex
    plex-media-server
    postman
    powershell
    slack
    ##spectacle
    sublime-merge
    sublime-text
    syncthing
    transmission
    visual-studio-code
    vlc
    zoom
    )
echo "Installing cask apps..."
brew install --cask ${CASKS[@]}



echo "Installing Python packages..."
PYTHON_PACKAGES=(
    virtualenv
    virtualenvwrapper
    pipenv
)

echo "alias pip=/usr/local/bin/pip3" >> ~/.zshrc
echo "alias python=/usr/local/bin/python3" >> ~/.zshrc
source ~/.zshrc

pip3 install ${PYTHON_PACKAGES[@]}



# housekeeping
# set soft link to Sublime
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# install Sublime package controller
wget "https://packagecontrol.io/Package%20Control.sublime-package" -P "~/Library/Application Support/Sublime Text 3/Installed Packages"

# set shortcut to VS Code
cat << EOF >> ~/.bash_profile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

## Install VS Code extensions

code --install-extension ms-python.python
code --install-extension ms-toolsai.jupyter
code --install-extension ms-dotnettools.csharp
code --install-extension ms-vscode.azure-account
code --install-extension vsciot-vscode.azure-iot-tools
code --install-extension dbaeumer.vscode-eslint
code --install-extension christian-kohler.path-intellisense
code --install-extension esbenp.prettier-vscode
code --install-extension wallabyjs.wallaby-vscode
code --install-extension mtxr.sqltools
code --install-extension waderyan.nodejs-extension-pack
code --install-extension quicktype.quicktype
code --install-extension humao.rest-client
code --install-extension eamodio.gitlens
code --install-extension 2gua.rainbow-brackets
code --install-extension wayou.vscode-todo-highlight
code --install-extension chakrounanas.turbo-console-log


# ruby install
# install latest ruby
brew install ruby
# echo "Installing Ruby gems"
RUBY_GEMS=(
	bundler
	byebug
	json
	middleman
	middleman-cli
	rake
	rspec
)
sudo gem install ${RUBY_GEMS[@]}

echo "Macbook setup completed!"