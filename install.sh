# !/bin/zsh

# Ask for admin password upfront
echo "Enter Admin Password"
-v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

bash "/Users/"$(whoami)"/DotFiles/.macos.sh"

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

# Install VS Code
echo "Installing VS Code"
curl -C - --output VSCode-darwin-universal.zip https://az764295.vo.msecnd.net/stable/6261075646f055b99068d3688932416f2346dd3b/VSCode-darwin-universal.zip
cp /Users/"$(whoami)"/VSCode-darwin-universal.zip /Users/"$(whoami)"/DotFiles
rm /Users/"$(whoami)"/VSCode-darwin-universal.zip
cd /Users/"$(whoami)"/DotFiles
unzip -q VSCode-darwin-universal.zip
sudo cp -R /Users/"$(whoami)"/DotFiles/Visual\ Studio\ Code.app /Applications

# Install Serialiser
echo "Activating Office"
sudo -S installer -allowUntrusted -verboseR -pkg "/Users/"$(whoami)"/DotFiles/Microsoft_Office_2019_VL_Serializer.pkg" -target /
cp /Users/"$(whoami)"/Microsoft_Office_2019_VL_Serializer.pkg /Users/"$(whoami)"/DotFiles
rm /Users/"$(whoami)"/Microsoft_Office_2019_VL_Serializer.pkg
sudo -S installer -allowUntrusted -verboseR -pkg "/Users/"$(whoami)"/DotFiles/Microsoft_Office_2019_VL_Serializer.pkg" -target /

# Install Python 3.11
echo "Installing Python"
curl -C - --output python-3.11.0-macos11.pkg https://www.python.org/ftp/python/3.11.0/python-3.11.0-macos11.pkg
cp /Users/"$(whoami)"/python-3.11.0-macos11.pkg /Users/"$(whoami)"/DotFiles
rm /Users/"$(whoami)"/python-3.11.0-macos11.pkg
sudo -S installer -allowUntrusted -verboseR -pkg "/Users/"$(whoami)"/DotFiles/3.11.0/python-3.11.0-macos11.pkg" -target /

# Install Skype 8.90.0.407
echo "Installing Skype"
curl -C - --output Skype-8.90.0.407.dmg https://download.skype.com/s4l/download/mac/Skype-8.90.0.407.dmg
cp /Users/"$(whoami)"/Skype-8.90.0.407.dmg /Users/"$(whoami)"/DotFiles
rm /Users/"$(whoami)"/Skype-8.90.0.407.dmg
hdiutil attach /Users/"$(whoami)"/DotFiles/Skype-8.90.0.407.dmg -quiet
sudo cp -R /Volumes/Skype/Skype.app /Applications
hdiutil unmount /Volumes/Skype -quiet -force

# Install Stremio 4.4.159
echo "Installing Stremio"
curl -C - --output Stremio+4.4.159.dmg https://dl.strem.io/shell-osx/v4.4.159/Stremio+4.4.159.dmg
cp /Users/"$(whoami)"/Stremio+4.4.159.dmg /Users/"$(whoami)"/DotFiles
rm /Users/"$(whoami)"/Stremio+4.4.159.dmg
hdiutil attach /Users/"$(whoami)"/DotFiles/Stremio+4.4.159.dmg -quiet
sudo cp -R /Volumes/Stremio\ 4.4.159\ 2/Stremio.app /Applications
hdiutil unmount /Volumes/Stremio\ 4.4.159\ 2/Stremio.app -quiet -force

# Install Calibre 6.8.0
echo "Installing Calibre"
curl -C - --output calibre-6.8.0.dmg https://download.calibre-ebook.com/6.8.0/calibre-6.8.0.dmg
cp /Users/"$(whoami)"/calibre-6.8.0.dmg /Users/"$(whoami)"/DotFiles
rm /Users/"$(whoami)"/calibre-6.8.0.dmg
hdiutil attach /Users/"$(whoami)"/DotFiles/calibre-6.8.0.dmg -quiet
sudo cp -R /Volumes/calibre-6.8.0/calibre.app /Applications
hdiutil unmount /Volumes/calibre-6.8.0/calibre.app -quiet -force

# Install App Cleaner
echo "Installing App Cleaner"
curl -C - --output AppCleaner_3.6.4.zip https://freemacsoft.net/downloads/AppCleaner_3.6.4.zip
cp /Users/"$(whoami)"/AppCleaner_3.6.4.zip /Users/"$(whoami)"/DotFiles
rm /Users/"$(whoami)"/AppCleaner_3.6.4.zip
cd /Users/"$(whoami)"/DotFiles
unzip -q AppCleaner_3.6.4.zip
sudo cp -R /Users/"$(whoami)"/DotFiles/AppCleaner.app /Applications

# Install Anki
echo "Installing Anki"
curl -C - --output anki-2.1.54-mac-intel-qt6.dmg "https://apps.ankiweb.net/downloads/archive/anki-2.1.54-mac-intel-qt6.dmg"
cp /Users/"$(whoami)"/anki-2.1.54-mac-intel-qt6.dmg /Users/"$(whoami)"/DotFiles
rm /Users/"$(whoami)"/anki-2.1.54-mac-intel-qt6.dmg
hdiutil attach /Users/"$(whoami)"/DotFiles/anki-2.1.54-mac-intel-qt6.dmg -quiet
sudo cp -R /Volumes/Anki/Anki.app /Applications
hdiutil unmount /Volumes/Anki/Anki.app -quiet -force

# Install KDE-Connect
echo "Installing KDE Connect"
curl -C - --output kdeconnect-kde-master-1713-macos-clang-x86_64.dmg https://binary-factory.kde.org/view/MacOS/job/kdeconnect-kde_Nightly_macos/lastSuccessfulBuild/artifact/kdeconnect-kde-master-1713-macos-clang-x86_64.dmg
cp /Users/"$(whoami)"/kdeconnect-kde-master-1713-macos-clang-x86_64.dmg /Users/"$(whoami)"/DotFiles
rm /Users/"$(whoami)"/kdeconnect-kde-master-1713-macos-clang-x86_64.dmg
hdiutil attach /Users/"$(whoami)"/DotFiles/kdeconnect-kde-master-1713-macos-clang-x86_64.dmg -quiet
sudo cp -R /Volumes/kdeconnect-kde-master-1713-macos-clang-x86_64.dmg/kdeconnect-indicator.app /Applications
hdiutil unmount /Volumes/kdeconnect-kde-master-1713-macos-clang-x86_64.dmg/kdeconnect-indicator.app -quiet -force

# Install GitHub Desktop
echo "Installing GitHub Desktop"
curl -C - --output GitHubDesktop-x64.zip https://desktop.githubusercontent.com/github-desktop/releases/3.1.2-7cd66717/GitHubDesktop-x64.zip
cp /Users/"$(whoami)"/GitHubDesktop-x64.zip /Users/"$(whoami)"/DotFiles
rm /Users/"$(whoami)"/GitHubDesktop-x64.zip
cd /Users/"$(whoami)"/DotFiles
unzip -q GitHubDesktop-x64.zip
sudo cp -R /Users/"$(whoami)"/DotFiles/GitHub\ Desktop.app /Applications

# Spoof MAC Address on Boot
echo "Spoof MAC Address on Boot"
mkdir -p /usr/local/sbin
chown ${whoami}:admin /usr/local/sbin

echo 'export PATH=$PATH:/usr/local/sbin' >> ~/.zshrc
source ~/.zshrc

cp /Users/"$(whoami)"/DotFiles/first-names.txt /usr/local/sbin/

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
scutil --set ComputerName "$computer_name"
scutil --set LocalHostName "$host_name"
scutil --set HostName "$host_name"
printf "%s\n" "Spoofed hostname to $host_name"

# Spoof MAC address of Wi-Fi interface
mac_address_prefix=$(networksetup -listallhardwareports | awk -v RS= '/en0/{print $NF}' | head -c 8)
mac_address_suffix=$(openssl rand -hex 3 | sed 's/\(..\)/\1:/g; s/.$//')
mac_address=$(echo "$mac_address_prefix:$mac_address_suffix" | awk '{print tolower($0)}')
networksetup -setairportpower en0 on
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --disassociate
ifconfig en0 ether "$mac_address"
printf "%s\n" "Spoofed MAC address of en0 interface to $mac_address"
EOF

chmod +x /usr/local/sbin/spoof.sh

cat << "EOF" | tee /Library/LaunchDaemons/local.spoof.plist
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

defaults write com.apple.loginwindow LogoutHook "/usr/local/sbin/spoof-hook.sh"

echo "Script finished"