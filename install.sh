# !/bin/zsh

# Ask for admin password upfront
echo "Enter Admin Password"
-v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

bash "/Users/"$(whoami)"/DotFiles/.macos.sh"

bash "/Users/"$(whoami)"/DotFiles/.applications.sh"

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