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
      nix-darwin,
      nix-homebrew,
      home-manager,
      ...
    }:
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#personal-laptop
      darwinConfigurations."personal-laptop" = nix-darwin.lib.darwinSystem {
        modules = [
          # Common
          (import ./common-conf.nix inputs)
          (import ./common-pkgs.nix inputs)
          (import ./common-gui.nix inputs)
          # Darwin
          (import ./darwin-conf.nix inputs)
          home-manager.darwinModules.home-manager
          ./home.nix
          nix-homebrew.darwinModules.nix-homebrew
          ./homebrew.nix
          # Personal
          (import ./personal-pkgs.nix inputs)
          (import ./personal-casks.nix inputs)
          (import ./personal-dock.nix inputs)
        ];
      };

      # Expose the package set, including overlays, for convenience.
      # darwinPackages = self.darwinConfigurations."personal-laptop".pkgs;

      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#corp-laptop
      darwinConfigurations."corp-laptop" = nix-darwin.lib.darwinSystem {
        modules = [
          # Common
          (import ./common-conf.nix inputs)
          (import ./common-pkgs.nix inputs)
          (import ./common-gui.nix inputs)
          # Darwin
          (import ./darwin-conf.nix inputs)
          home-manager.darwinModules.home-manager
          ./home.nix
          nix-homebrew.darwinModules.nix-homebrew
          ./homebrew.nix
          # Corp
          (import ./corp-dock.nix inputs)
        ];
      };

      # Build darwin flake using:
      # $ nixos-rebuild build --flake .#towelie.c.googlers.com
      nixosConfigurations."towelie.c.googlers.com" = nixpkgs.lib.nixosSystem {
        modules = [
          # Common
          (import ./common-conf.nix inputs)
          (import ./common-pkgs.nix inputs)
          # Linux
          (import ./linux-conf.nix inputs)
        ];
      };
    };
}
