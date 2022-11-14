# !/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off
brew upgrade

brew install --cask rectangle

# # Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 409201541 #Pages
mas install 409203825 #Numbers
mas install 1352778147 #Bitwarden
mas install 462054704 #Word
mas install 462062816 #PowerPoint

# macOS Settings
echo "Resize dock icons to 36px"
sudo defaults write com.apple.dock "tilesize" -int "36" && killall Dock

echo "Enable autohide"
defaults write com.apple.dock "autohide" -bool "true" # enable autohide

echo "Left align dock"
defaults write com.apple.dock "orientation" -string "left" && killall Dock # left align

echo "Reduce dock unhide animation"
defaults write com.apple.dock "autohide-time-modifier" -float "0.25" # reduce animation

echo "Unhide dock immediately on hover"
defaults write com.apple.dock "autohide-delay" -float "0" # unhide immediately

echo "Don't show recents"
defaults write com.apple.dock "show-recents" -bool "false" # hide recents

echo "Allow quitting Finder via ⌘ + Q"
defaults write com.apple.finder "QuitMenuItem" -bool "true"

echo "Hide desktop icons"
defaults write com.apple.finder "CreateDesktop" -bool "false" && killall Finder

echo "Minimise animation to 'scale'"
defaults write com.apple.dock "mineffect" -string "scale"

echo "Disable the warning when changing a file extension"
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

echo "Don't automatically save to cloud"
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false" # don't auto save to cloud

echo "Enable snap-to-grid for desktop icons"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver "askForPassword" -int "1"
defaults write com.apple.screensaver "askForPasswordDelay" -int "0"

echo "Tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Clicking" -bool "true"
defaults -currentHost write NSGlobalDomain "com.apple.mouse.tapBehavior" -int "1"
defaults write NSGlobalDomain "com.apple.mouse.tapBehavior" -int "1"

echo "Firm Haptic Feedback"
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "1"
defaults write com.apple.AppleMultitouchTrackpad "SecondClickThreshold" -int "2"

echo "Fast trackpad tracking"
defaults write NSGlobalDomain "com.apple.trackpad.scaling" -int "3"

echo "Enable three finger drag"
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -int "1"
defaults write com.apple.AppleMultitouchTrackpad "com.apple.driver.AppleBluetoothMultitouch.trackpad" -int "1"

echo "Show path bar in Finder"
defaults write com.apple.finder "ShowPathbar" -bool "true"

echo "Show status bar in Finder"
defaults write com.apple.finder "ShowStatusBar" -bool "true"

echo "Show seconds in menu bar"
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\"" # show seconds in menu bar

echo "Immediately unhide icon in Finder title"
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0" # immediately show icon in finder next to name

echo "Expand save file panel by default"
defaults write NSGlobalDomain "NSNavPanelExpandedStateForSaveMode" -bool "true" # expand save window by default

echo "Expand print panel by default"
defaults write NSGlobalDomain "PMPrintingExpandedStateForPrint" -bool "true" # expand print panel

echo "Change Finder Sidebar size"
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "1"

echo "Enable spring loaded for all icons in dock"
defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool "true"

echo "Increase window resize speed for Cocoa applications"
defaults write NSGlobalDomain "NSWindowResizeTime" -float "0.001"

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool "true"

echo "Disable media not ejected properly notification"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd 

echo "Don't show TimeMachine message for new drives"
sudo defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES

echo "Save ScreenShots as .jpg instead of .png"
defaults write com.apple.screencapture type jpg

echo "Make apps with hidden windows translucent"
defaults write com.apple.Dock showhidden -bool TRUE && killall Dock

echo "Remove all Dock icons"
defaults write com.apple.dock persistent-apps -array

echo "Restarting Dock and Finder"
killall Dock && killall Finder

# Python Packages
echo "Installing Python Packages..."
pip3 install --upgrade pip
pip3 install matplotlib
pip3 install seaborn
pip3 install colorama

# Spoof MAC Address on Boot
sudo mkdir -p /usr/local/sbin
sudo chown ${whoami}:admin /usr/local/sbin

echo 'export PATH=$PATH:/usr/local/sbin' >> ~/.zshrc
source ~/.zshrc

sudo curl --fail --output /usr/local/sbin/first-names.txt https://raw.githubusercontent.com/sunknudsen/privacy-guides/master/how-to-spoof-mac-address-and-hostname-automatically-at-boot-on-macos/first-names.txt

cat << "EOF" > /usr/local/sbin/spoof.sh
#! /bin/sh

set -e
set -o pipefail

export LC_CTYPE=C

basedir=$(dirname "$0")

# Spoof computer name
first_name=$(sed "$(jot -r 1 1 2048)q;d" $basedir/first-names.txt | sed -e 's/[^a-zA-Z]//g')
model_name=$(system_profiler SPHardwareDataType | awk '/Model Name/ {$1=$2=""; print $0}' | sed -e 's/^[ ]*//')
computer_name="$first_name’s $model_name"
host_name=$(echo $computer_name | sed -e 's/’//g' | sed -e 's/ /-/g')
sudo scutil --set ComputerName "$computer_name"
sudo scutil --set LocalHostName "$host_name"
sudo scutil --set HostName "$host_name"
printf "%s\n" "Spoofed hostname to $host_name"

# Spoof MAC address of Wi-Fi interface
mac_address_prefix=$(networksetup -listallhardwareports | awk -v RS= '/en0/{print $NF}' | head -c 8)
mac_address_suffix=$(openssl rand -hex 3 | sed 's/\(..\)/\1:/g; s/.$//')
mac_address=$(echo "$mac_address_prefix:$mac_address_suffix" | awk '{print tolower($0)}')
networksetup -setairportpower en0 on
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --disassociate
sudo ifconfig en0 ether "$mac_address"
printf "%s\n" "Spoofed MAC address of en0 interface to $mac_address"
EOF

chmod +x /usr/local/sbin/spoof.sh

cat << "EOF" | sudo tee /Library/LaunchDaemons/local.spoof.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>local.spoof</string>

    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/sbin/spoof.sh</string>
    </array>

    <key>RunAtLoad</key>
    <true/>
  </dict>
</plist>
EOF

cat << "EOF" > /usr/local/sbin/spoof-hook.sh
#! /bin/sh

# Turn off Wi-Fi interface
networksetup -setairportpower en0 off
EOF

chmod +x /usr/local/sbin/spoof-hook.sh

sudo defaults write com.apple.loginwindow LogoutHook "/usr/local/sbin/spoof-hook.sh"