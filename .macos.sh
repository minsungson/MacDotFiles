# !/bin/zsh

# Kill System Preferences to prevent override
osascript -e 'tell application "System Preferences" to quit'

# macOS Settings
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool true #Don't write DS
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool false #Don't show file extensions
defaults write NSGlobalDomain "com.apple.swipescrolldirection" -bool true #Enable Natural Scroll
defaults write NSGlobalDomain "NSAutomaticSpellingCorrectionEnabled" -bool true #Enable Autocorrect
defaults write com.apple.dock "mineffect" -string "suck" && killall Dock #Change minimise animation
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
defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist "AutomaticCheckEnabled" -bool YES #Auto check for Software Updates
defaults write /Library/Preferences/com.apple.SoftwareUpdate "AutomaticDownload" -bool YES #Auto download Software Updates
defaults write /Library/Preferences/com.apple.commerce "AutoUpdate" -bool YES #Auto update apps
defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist "CriticalUpdateInstall" -bool YES #Auto install critical updates
defaults write com.apple.dock "tilesize" -int "36" && killall Dock #Resize dock icons to 36px
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
defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && pkill diskarbitrationd #Disable media not ejected properly notification
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool YES #Don't show TimeMachine message for new drives
defaults write com.apple.screencapture type jpg #Save ScreenShots as .jpg instead of .png
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40 #Improve bluetooth audio quality?
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv" #Finder windows open with list view
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist #Enable snap-to-grid
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist #Enable snap-to-grid
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist #Enable snap-to-grid
defaults write com.apple.dock wvous-bl-corner -int 11 #Bottom left hot corner for mission control
defaults write com.apple.dock wvous-bl-modifier -int 0 #Bottom left hot corner for mission control
defaults write com.apple.dock wvous-br-corner -int 5 #Bottom right hot corner for screensaver
defaults write com.apple.dock wvous-br-modifier -int 0 #Bottom right hot corner for screensaver
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false # Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.terminal FocusFollowsMouse -bool true # Enable “focus follows mouse” for Terminal.app
defaults write -g NSAlertMetricsGatheringEnabled -bool false # Change to old style alert pane
defaults write com.apple.CrashReporter UseUNC 1 # Show Crash Reporter as notification

# Set Locale
echo "Settings Locale"
defaults write NSGlobalDomain AppleLanguages -array "de" "de"
defaults write NSGlobalDomain AppleLocale -string "de_GB@currency=GBP"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -int 1

# Energy settings
echo "Changing Energy Settings"
sudo systemsetup -setrestartfreeze on # Restart automatically if the computer freezes
sudo pmset -a displaysleep 15 # Sleep the display after 15 minutes
sudo pmset -c displaysleep 20 # Sleep the display after 20 minutes when charging
sudo pmset -b sleep 15 # Set machine sleep to 5 minutes on battery
sudo pmset -a hibernatemode 3 # 3: Copy RAM to disk so the system state can still be restored in case of a power failure

# Change wallpaper
echo "Changing Wallpaper"
cp /Users/"$(whoami)"/DotFiles/archMacintosh.png /Users/"$(whoami)"/Pictures/
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/"$(whoami)"/Pictures/archMacintosh.png"'

# Install all latest Software Updates
echo "Installing Software Updates"
softwareupdate -i -a