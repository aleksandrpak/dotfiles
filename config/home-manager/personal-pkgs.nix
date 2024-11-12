{ ... }:
{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # Development
    ## Version control
    git
    ## Virtual environment
    docker
    ## Java
    zulu
    ## Flutter
    flutter
    # GUI
    google-chrome
  ];
}
