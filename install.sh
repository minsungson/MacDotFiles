# !/bin/zsh

# Install all latest Software Updates
sudo softwareupdate -i -a

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off
brew upgrade
brew install mas
brew install -- cask amethyst

# # Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 409201541 #Pages
mas install 409203825 #Numbers
mas install 1352778147 #Bitwarden
mas install 462054704 #Word
mas install 462062816 #PowerPoint

# macOS Settings
echo "Changing macOS Settings"
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool true #Don't write DS
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool false #Don't show file extensions
defaults write NSGlobalDomain "com.apple.swipescrolldirection" -bool true #Enable Natural Scroll
defaults write NSGlobalDomain "NSAutomaticSpellingCorrectionEnabled" -bool true #Enable Autocorrect
defaults write com.apple.dock mineffect -string "suck" && killall Dock #Change minimise animation
defaults delete NSGlobalDomain AppleHighlightColor #Highlight colour same as accent colour
defaults write -g "NSNavPanelExpandedStateForSaveMode" -boolean true #Expand Save windows by default
defaults write -g "NSNavPanelExpandedStateForSaveMode2" -bool true #Expand Save windows by default
defaults write -g "PMPrintingExpandedStateForPrint" -boolean true #Expand Print window by default
defaults write -g "PMPrintingExpandedStateForPrint2" -bool true #Expand Print window by default
defaults write -g "NSDocumentSaveNewDocumentsToCloud" -bool false #Don't automatically save to iCloud Drive
defaults write com.apple.screencapture disable-shadow -bool true  && killall SystemUIServer #Disable shadow on Screenshots
defaults write com.apple.Safari "AutoOpenSafeDownloads" -bool false #Don't auto extract compressed files from Safari Downloads
defaults write com.apple.Safari "IncludeDevelopMenu" -bool true #Show Developer Menu
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool true #Show External Drives on Desktop
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool true #Show Internal Drives on Desktop
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool true #Show Connnected Servers on Desktop
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool false #Show Removal Media on Desktop
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool false #Don't warn about file extension change
defaults write com.apple.finder "_FXShowPosixPathInTitle" -bool false #Don't show file path in address bar
defaults write com.apple.LaunchServices "LSQuarantine" -bool NO
defaults write com.apple.DiskUtility "DUShowEveryPartition" -bool true #Show hidden partitions
defaults write com.apple.finder "AppleShowAllFiles" false #Don't show hidden files
defaults write com.apple.finder "ShowStatusBar" -bool true #Show status bar
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int 1 #Small sidebar icons
defaults write com.apple.mail "SendWindowsFriendlyAttachments" -boolean TRUE #Send Windows Ffiendly attachments
defaults -currentHost write com.apple.QuickTimePlayerX.plist "MGEnableCCAndSubtitlesOnOpen" -bool TRUE #Auto show CC
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist "AutomaticCheckEnabled" -bool YES #Auto check for Software Updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate "AutomaticDownload" -bool YES #Auto download Software Updates
sudo defaults write /Library/Preferences/com.apple.commerce "AutoUpdate" -bool YES #Auto update apps
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist "CriticalUpdateInstall" -bool YES #Auto install critical updates
sudo defaults write com.apple.dock "tilesize" -int "36" && killall Dock #Resize dock icons to 36px
defaults write com.apple.dock "autohide" -bool "true" # enable autohide
defaults write com.apple.dock "orientation" -string "left" && killall Dock # left align
defaults write com.apple.dock "autohide-time-modifier" -float "0.25" # reduce animation
defaults write com.apple.dock "autohide-delay" -float "0" # unhide immediately
defaults write com.apple.dock "show-recents" -bool "false" # hide recents
defaults write com.apple.finder "QuitMenuItem" -bool "true"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist #Enable snap-to-grid for desktop icons
defaults write com.apple.screensaver "askForPassword" -int "1" #Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver "askForPasswordDelay" -int "0" #Require password immediately after sleep or screen saver begins
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Clicking" -bool "true" #Tap to click for this user and for the login screen
defaults -currentHost write NSGlobalDomain "com.apple.mouse.tapBehavior" -int "1" #Tap to click for this user and for the login screen
defaults write NSGlobalDomain "com.apple.mouse.tapBehavior" -int "1" #Tap to click for this user and for the login screen
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "0" #Soft Haptic Feedback
defaults write com.apple.AppleMultitouchTrackpad "SecondClickThreshold" -int "0" #Soft Haptic Feedback
defaults write NSGlobalDomain "com.apple.trackpad.scaling" -int "3" #Fast trackpad tracking
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -int "1"  #Enable three finder drag for internal trackpad
defaults write com.apple.AppleMultitouchTrackpad "com.apple.driver.AppleBluetoothMultitouch.trackpad" -int "1" #Enable three finder drag for external trackpad
defaults write com.apple.finder "ShowPathbar" -bool "true" #Show path bar in Finder
defaults write com.apple.finder "ShowStatusBar" -bool "true" #Show status bar in Finder
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\"" # show seconds in menu bar
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0" # immediately show icon in finder next to name
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd #Disable media not ejected properly notification
sudo defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool YES #Don't show TimeMachine message for new drives
defaults write com.apple.screencapture type jpg #Save ScreenShots as .jpg instead of .png

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

sudo curl --fail --output /usr/local/sbin/first-names.txt https://raw.githubusercontent.com/minsungson/DotFiles/master/first-names.txt

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

echo "Script finished"