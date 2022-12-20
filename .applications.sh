# !/bin/zsh

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

# Install Python 3.11
echo "Installing Python"
curl -C - --output python-3.11.0-macos11.pkg https://www.python.org/ftp/python/3.11.0/python-3.11.0-macos11.pkg
sudo -S installer -allowUntrusted -verboseR -pkg "/Users/"$(whoami)"/python-3.11.0-macos11.pkg" -target /
rm /Users/"$(whoami)"/python-3.11.0-macos11.pkg

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