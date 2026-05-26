# Sets reasonable macOS defaults.
#
# Or, in other words, set shit how I like in macOS.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Run ./set-defaults.sh and you'll be good to go.

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Always show filename extensions and hidden files in Finder.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 1

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Run the screensaver if we're in the bottom-left hot corner.
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Set up Dock apps. Finder is always first.
dock_item() {
  printf '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>%s</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>' "$1"
}

add_dock_app() {
  app_path="$1"

  if [ -e "$app_path" ]; then
    defaults write com.apple.dock persistent-apps -array-add "$(dock_item "$app_path")"
  else
    echo "Skipping Dock item: $app_path not found."
  fi
}

defaults write com.apple.dock persistent-apps -array
add_dock_app "/System/Applications/Reminders.app"
add_dock_app "/Applications/Spotify.app"
add_dock_app "/System/Applications/Calendar.app"
add_dock_app "/System/Applications/Mail.app"
add_dock_app "/Applications/Google Chrome.app"
add_dock_app "/Applications/Xcode.app"
add_dock_app "/Applications/Claude.app"
add_dock_app "/Applications/Codex.app"
add_dock_app "/Applications/Cursor.app"
add_dock_app "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
add_dock_app "/Applications/Sublime Text.app"
add_dock_app "/Applications/Sublime Merge.app"
add_dock_app "/Applications/Ghostty.app"
killall Dock

# Hide Safari's bookmark bar.
defaults write com.apple.Safari.plist ShowFavoritesBar -bool false

# Always show Safari's "URL display" tab in the lower left on mouseover. Strangely
# like, everyone and their LLMs on the internet thinks this is ShowStatusBar, but
# it's not.
defaults write com.apple.Safari ShowOverlayStatusBar -bool true

# Set up Safari for development.
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true
defaults write com.apple.Safari.plist IncludeDevelopMenu -bool true
defaults write com.apple.Safari.plist WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari.plist "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
