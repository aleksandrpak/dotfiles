{
  description = "Alps Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nix-homebrew,
      home-manager,
      nixpkgs,
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          # Options at http://mynixos.com
          users.users.alekspak = {
            name = "alekspak";
            home = "/Users/alekspak";
          };

          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = with pkgs; [
            # Development
            ## Nix
            nixd
            nixfmt-rfc-style
            ## Go
            go
            ## Rust
            rustup
            ## Python
            python3
            ## Java
            zulu
            ## Flutter
            flutter
            ## IDE
            vim
            neovim
            ## Virtual environment
            docker
            ## Version control
            git
            gh
            delta
            # System tools
            btop
            e2fsprogs
            ffmpeg
            file
            fx
            silver-searcher
            tldr
            tmux
            tree
            wget
            ## ZSH
            zsh
            fzf
            fd
            eza
            bat
            oh-my-posh
            # GUI
            # TODO: add firefox
            discord
            google-chrome
            obsidian
            protonmail-bridge
            vscode
            ## MacOS only
            # TODO: Delete when wezterm is good
            iterm2
            raycast
            stats
            xcode-install
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
              "shortcutdetective"
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
            # Reduce desktop switching animation time
            dock.expose-animation-duration = 0.0;
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
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.users.alekspak = {
              targets.darwin.defaults."com.apple.desktopservices".DSDontWriteNetworkStores = true;

              # This value determines the Home Manager release that your configuration is
              # compatible with. This helps avoid breakage when a new Home Manager release
              # introduces backwards incompatible changes.
              #
              # You should not change this value, even if you update Home Manager. If you do
              # want to update the value, then make sure to first check the Home Manager
              # release notes.
              home.stateVersion = "24.11";

              # Let Home Manager install and manage itself.
              programs.home-manager.enable = true; # Please read the comment before changing.
            };
          }
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
