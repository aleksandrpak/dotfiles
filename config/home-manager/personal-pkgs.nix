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
    # Accounting
    beancount
    # TODO: fava (need 1.29 for dark)
    # TODO: remove after fava is available
    pipx
  ];
}
