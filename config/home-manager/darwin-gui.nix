{ ... }:
{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # TODO: firefox
    obsidian
    protonmail-bridge
    vscode
    # MacOS only
    raycast
    stats
    xcode-install
  ];
}
