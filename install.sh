# !/bin/zsh

# Ask for admin password upfront
echo "Enter Admin Password"
-v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install xCode cli tools
echo "Installing commandline tools"
xcode-select --install

# Install Brew
echo "Installing Brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off
brew upgrade
brew install mas
brew install --cask rectangle
brew install nextdns/tap/nextdns
brew install dockutil
brew cask install iterm2

# # Mac App Store Apps
echo "Installing Mac App Store Apps"
mas install 409201541 #Pages
mas install 409203825 #Numbers
mas install 1352778147 #Bitwarden
mas install 462054704 #Word
mas install 462062816 #PowerPoint

# Python Packages
echo "Installing Python Packages"
pip3 install --upgrade pip
pip3 install matplotlib
pip3 install seaborn
pip3 install colorama

# Change macOS Defaults
echo "Quitting System Preferences and Changing macOS Settings"
bash "/Users/"$(whoami)"/DotFiles/.macos.sh"

# Install Mac Apps
echo "Installing Apps"
bash "/Users/"$(whoami)"/DotFiles/.applications.sh"

# Add Dock Icons
echo "Adding Dock Items"
dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Firefox.app"
dockutil --no-restart --add "/System/Applications/Mail.app"
dockutil --no-restart --add "/System/Applications/Music.app"
dockutil --no-restart --add "/Applications/VS\ Code.app"
killall Dock

# iTerm2 stuff
echo "Installing iTerm2"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $
# nano ~/.zshrc and change ZSH_TEME=“powerlevel10k/powerlevel10k”

# Spoof MAC Address on Boot
echo "Spoof MAC Address on Boot"
bash "/Users/"$(whoami)"/DotFiles/.spoof-MAC-Address.sh"

echo "Script finished"