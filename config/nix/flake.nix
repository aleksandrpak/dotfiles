{
  description = "Alps Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nix-homebrew,
      nixpkgs,
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          # Options at http://mynixos.com

          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            # Development
            ## Nix
            pkgs.nixd
            pkgs.nixfmt-rfc-style
            ## Go
            pkgs.go
            ## Rust
            pkgs.rustup
            ## Python
            pkgs.python3
            ## Flutter
            pkgs.flutter
            ## IDE
            pkgs.vim
            pkgs.neovim
            ## Virtual environment
            pkgs.docker
            ## Version control
            pkgs.gh
            # Personal
            pkgs.beancount
            pkgs.fava
            # System tools
            pkgs.e2fsprogs
            pkgs.ffmpeg
            pkgs.file
            pkgs.silver-searcher
            pkgs.tmux
            pkgs.tree
            pkgs.wget
            pkgs.zsh
            pkgs.zsh-syntax-highlighting
            # Fonts
            # GUI
            # TODO: add pkgs.firefox
            pkgs.discord
            pkgs.google-chrome
            pkgs.obsidian
            pkgs.protonmail-bridge
            pkgs.vscode
            ## MacOS only
            # TODO: Delete when wezterm is good
            pkgs.iterm2
            pkgs.raycast
            pkgs.stats
            pkgs.xcode-install
          ];

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
              "tailscale" # TODO: Do not install on corp
              "telegram"
              "termius"
              "the-unarchiver"
              "ticktick"
              "wezterm@nightly"
              "windows-app" # TODO: Do not install on corp
            ];
            masApps = {
              "DarkReader" = 1438243180;
              "Infuse" = 1136220934;
              "Wipr" = 1320666476;
            };
          };

          fonts.packages = with pkgs; [
            inconsolata
            cascadia-code
            powerline-fonts
          ];

          # Auto upgrade nix package and the daemon service.
          services.nix-daemon.enable = true;
          # nix.package = pkgs.nix;

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          nixpkgs.config.allowUnfree = true;

          # Create /etc/zshrc that loads the nix-darwin environment.
          programs.zsh.enable = true; # default shell on catalina

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          system.defaults = {
            dock.autohide = true;
            # Don't arrange spaces based on latest usage
            dock.mru-spaces = false;
            dock.persistent-apps = [
              "/Applications/Safari.app"
              "/Applications/WezTerm.app"
              "${pkgs.vscode}/Applications/Visual Studio Code.app"
              "${pkgs.obsidian}/Applications/Obsidian.app"
              "/Applications/Telegram.app"
              "/Applications/TickTick.app"
              "/System/Applications/System Settings.app"
            ];
            # Disable guest login
            loginwindow.GuestEnabled = false;
            # Use F1, F2, etc. keys as standard function keys
            NSGlobalDomain."com.apple.keyboard.fnState" = true;
            # Whether to use 24-hour or 12-hour time
            NSGlobalDomain.AppleICUForce24HourTime = true;
            # Disable press-and-hold for keys in favor of key repeat
            NSGlobalDomain.ApplePressAndHoldEnabled = false;
            # The key’s character begins to repeat
            NSGlobalDomain.InitialKeyRepeat = 15;
            # Keyboard repeat rate
            NSGlobalDomain.KeyRepeat = 2;
            NSGlobalDomain.AppleInterfaceStyle = "Dark";
            # Whether to allow quitting of the Finder
            finder.QuitMenuItem = true;
            # Whether to always show file extensions
            finder.AppleShowAllExtensions = true;
            finder.ShowPathbar = true;
            finder.ShowStatusBar = true;
            # Tap to click
            trackpad.Clicking = true;
          };

          # Use fingerprint for sudo
          security.pam.enableSudoTouchIdAuth = true;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # The platform the configuration will be used on.
          # TODO: Add Intel CPU for desktop "x86_64-darwin"
          nixpkgs.hostPlatform = "aarch64-darwin";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#personal
      darwinConfigurations."personal" = nix-darwin.lib.darwinSystem {
        modules = [ 
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = true;

              # User owning the Homebrew prefix
              user = "alekspak";

              # Automatically migrate existing Homebrew installations
              autoMigrate = true;
            };
          }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."personal".pkgs;
    };
}
