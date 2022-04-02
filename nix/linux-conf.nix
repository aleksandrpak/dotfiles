{ self, ... }:
{ pkgs, ... }:
{
  # Options at http://mynixos.com
  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = pkgs.stdenv.lib.platforms.x86_64-linux;
}
