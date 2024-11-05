{
  description = "Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      nix-darwin,
      nix-homebrew,
      home-manager,
      ...
    }:
    {
      darwinConfigurations."personal-laptop" = nix-darwin.lib.darwinSystem {
        modules = [
          # Darwin
          (import ./darwin-conf.nix inputs)
          (import ./darwin-gui.nix inputs)
          home-manager.darwinModules.home-manager
          ./darwin-home.nix
          nix-homebrew.darwinModules.nix-homebrew
          ./homebrew.nix
          # Personal
          (import ./personal-pkgs.nix inputs)
          (import ./personal-casks.nix inputs)
          (import ./personal-dock.nix inputs)
        ];
      };

      darwinConfigurations."corp-laptop" = nix-darwin.lib.darwinSystem {
        modules = [
          # Darwin
          (import ./darwin-conf.nix inputs)
          (import ./darwin-gui.nix inputs)
          home-manager.darwinModules.home-manager
          ./darwin-home.nix
          nix-homebrew.darwinModules.nix-homebrew
          ./homebrew.nix
          # Corp
          (import ./corp-dock.nix inputs)
        ];
      };

      homeConfigurations."alekspak@towelie.c.googlers.com" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ (import ./google-home.nix nixpkgs.legacyPackages.x86_64-linux) ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to google-home.nix
      };
    };
}
