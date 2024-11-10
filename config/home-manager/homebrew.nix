{
  nix-homebrew = {
    # Install Homebrew under the default prefix
    enable = true;

    # User owning the Homebrew prefix
    user = "alekspak";

    # Automatically migrate existing Homebrew installations
    autoMigrate = true;
  };
}
