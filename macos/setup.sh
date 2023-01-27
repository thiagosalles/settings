# Reference: https://macos-defaults.com/


# Dock - Set the icon size of Dock items to 48 pixels
defaults write com.apple.dock tilesize -int 48

# Dock - Enable magnification
defaults write com.apple.dock magnification -bool true

# Dock - Set the icon larger size of magnified items to 96 pixels
defaults write com.apple.dock largesize -int 96

# Dock - Auto-hide the Dock
defaults write com.apple.dock autohide -bool true

# Dock - Minimize Windows Using Genie Effect
defaults write com.apple.dock mineffect -string "genie"

# Dock - Reload to apply settings
killall Dock


# Screenshots - Disable shadow
defaults write com.apple.screencapture disable-shadow -bool true

# Screenshots - Set default screenshot location
mkdir ~/Pictures/ScreenShots > /dev/null 2>&1 || true
defaults write com.apple.screencapture location -string "~/Pictures/ScreenShots"
# TODO: Add "~/Pictures/ScreenShots" to the side bar

# Screenshots - Reload to apply settings
killall SystemUIServer


# Finder - Show all file extensions
# defaults write -g AppleShowAllExtensions -bool true

# Finder - Show path bar and status bar in the bottom of the windows
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Finder - Set the default view style for folders without custom setting to List View
# TODO: Não funcionou no Ventura
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder - Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Finder - Set the default search scope to the current folder when performing a search
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Finder - Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder - New windows show the Downloads folder
# TODO: Não funcionou no Ventura
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"

# TODO: Finder - Configure Sidebar items

# Finder - Reload to apply settings
killall Finder


# Trackpad - Enable Tap to Click
# TODO: Não funcionou no Ventura
defaults -currentHost write -globalDomain com.apple.mouse.tapBehavior -bool true

# Trackpad - Disable Force Click Context Menu
# TODO: Não funcionou no Ventura
defaults write -g com.apple.trackpad.forceClick -bool false

# Trackpad: Enable right click with two fingers
# TODO: Não funcionou no Ventura
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true

# TODO: Trackpad: Mission Control with Four Fingers
# TODO: Trackpad: App Exposé with Four Fingers

# TODO: Accessibility: Pointer Control: Trackpad Options: Use Trackpad for Draging Enabled
# TODO: Accessibility: Pointer Control: Trackpad Options: Dragging Style with Three Fingers


# Keyboard - Key Repeat (default 2 - 30ms)
# defaults write -g KeyRepeat -int 2

# Keyboard - Initial Repeat (default 15 - 225ms)
# defaults write -g InitialKeyRepeat -int 15

# Keyboard - Automatically switch to a document's input source
# defaults write com.apple.HIToolbox AppleGlobalTextInputProperties TextInputGlobalPropertyPerContextInput -bool true

# Keyboard - Disables auto capitalization
# defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Keyboard - Disables "smart" dashes
# defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Keyboard - Disables automatic period substitutions
# defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Keyboard - Disables smart quotes
# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Keyboard - Disable AutoCorrect
# defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Keyboard - Disable Hold Key and Suggestions
# defaults write -g ApplePressAndHoldEnabled -bool false

# Keyboard - Enable Dialog Controls with Tabs
# defaults write NSGlobalDomain AppleKeyboardUIMode -int 2


# Regional Settings - Account
# defaults write NSGlobalDomain AppleLanguages -array "en-US" "pt"
# defaults write NSGlobalDomain AppleLocale -string "en_US"
# defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
# defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"
# defaults write NSGlobalDomain AppleICUForce12HourTime -bool false

