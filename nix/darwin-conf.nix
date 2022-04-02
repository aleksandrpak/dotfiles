{ self, ... }:
{ pkgs, ... }:
{
  # Options at http://mynixos.com
  users.users.alekspak = {
    name = "alekspak";
    home = "/Users/alekspak";
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    brews = [
      "mas"
    ];
    casks = [
      "proton-pass"
      "protonvpn"
      "steam"
      "telegram"
      "the-unarchiver"
      "ticktick"
      "wezterm@nightly"
    ];
    masApps = {
      "DarkReader" = 1438243180;
      "Infuse" = 1136220934;
      "Wipr" = 1320666476;
    };
  };

  system.defaults = {
    dock.autohide = true;
    # Don't arrange spaces based on latest usage
    dock.mru-spaces = false;
    # Reduce desktop switching animation time
    dock.expose-animation-duration = 0.0;
    # Disable guest login
    loginwindow.GuestEnabled = false;
    # Use F1, F2, etc. keys as standard function keys
    NSGlobalDomain."com.apple.keyboard.fnState" = true;
    # Whether to use 24-hour or 12-hour time
    NSGlobalDomain.AppleICUForce24HourTime = true;
    # Reduce window resize time
    NSGlobalDomain.NSWindowResizeTime = 1.0e-3;
    # Enable full keyboard access for all controls
    NSGlobalDomain.AppleKeyboardUIMode = 3;
    # Disable press-and-hold for keys in favor of key repeat
    NSGlobalDomain.ApplePressAndHoldEnabled = false;
    # The key’s character begins to repeat
    NSGlobalDomain.InitialKeyRepeat = 15;
    # Keyboard repeat rate
    NSGlobalDomain.KeyRepeat = 2;
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    # Enable subpixel font rendering on non-Apple LCDs
    NSGlobalDomain.AppleFontSmoothing = 2;
    # Expand save dialog by default
    NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
    # Whether to allow quitting of the Finder
    finder.QuitMenuItem = true;
    # Whether to always show file extensions
    finder.AppleShowAllExtensions = true;
    # Use current directory as default search scope in Finder
    finder.FXDefaultSearchScope = "SCcf";
    finder.ShowPathbar = true;
    finder.ShowStatusBar = true;
    # Tap to click
    trackpad.Clicking = true;
  };

  # Use fingerprint for sudo
  security.pam.enableSudoTouchIdAuth = true;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = pkgs.stdenv.lib.platforms.aarch64-darwin;
}
